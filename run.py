#!/usr/bin/env python3

from __future__ import annotations

import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parent
SEARCH_DIRS = [ROOT / "cpp", ROOT / "swift", ROOT / "python"]
COMPILE_CACHE = Path(tempfile.gettempdir()) / "psrun"


def usage() -> None:
    print("usage: psrun <filename> [args...]", file=sys.stderr)
    raise SystemExit(1)


def find_source(name: str) -> Path:
    candidate = Path(name)
    if candidate.is_absolute() or candidate.exists():
        return candidate.resolve()

    suffix = candidate.suffix.lower()
    search_dirs = SEARCH_DIRS
    if suffix == ".c" or suffix in {".cpp", ".cc", ".cxx"}:
        search_dirs = [ROOT / "cpp"]
    elif suffix == ".swift":
        search_dirs = [ROOT / "swift"]
    elif suffix == ".py":
        search_dirs = [ROOT / "python"]

    matches: list[Path] = []
    for base in search_dirs:
        if base.exists():
            direct = base / name
            if direct.is_file():
                return direct.resolve()
            matches.extend(p for p in base.rglob(name) if p.is_file())

    if not matches:
        raise FileNotFoundError(f"could not find source file: {name}")

    matches.sort(key=lambda p: (len(p.parts), str(p)))
    return matches[0].resolve()


def compile_cpp(source: Path) -> Path:
    COMPILE_CACHE.mkdir(parents=True, exist_ok=True)
    output = COMPILE_CACHE / source.stem
    compiler = shutil.which("g++") or shutil.which("clang++")
    if compiler is None:
        raise RuntimeError("no C++ compiler found (g++ or clang++)")

    subprocess.run(
        [compiler, "-std=c++20", "-O2", "-Wall", str(source), "-o", str(output)],
        check=True,
        cwd=ROOT,
    )
    return output


def compile_swift(source: Path) -> Path:
    COMPILE_CACHE.mkdir(parents=True, exist_ok=True)
    output = COMPILE_CACHE / source.stem
    compiler = shutil.which("swiftc")
    if compiler is None:
        raise RuntimeError("swiftc not found")

    subprocess.run([compiler, str(source), "-o", str(output)], check=True, cwd=ROOT)
    return output


def run_python(source: Path) -> list[str]:
    interpreter = shutil.which("python3") or shutil.which("python")
    if interpreter is None:
        raise RuntimeError("python3 not found")
    return [interpreter, str(source)]


def main() -> None:
    if len(sys.argv) < 2:
        usage()

    source = find_source(sys.argv[1])
    extra_args = sys.argv[2:]
    suffix = source.suffix.lower()

    if suffix in {".c", ".cpp", ".cc", ".cxx"}:
        executable = compile_cpp(source)
        command = [str(executable), *extra_args]
    elif suffix == ".swift":
        executable = compile_swift(source)
        command = [str(executable), *extra_args]
    elif suffix == ".py":
        command = [*run_python(source), *extra_args]
    else:
        raise SystemExit(f"unsupported file type: {source.suffix}")

    subprocess.run(command, check=True, cwd=ROOT)


if __name__ == "__main__":
    main()
