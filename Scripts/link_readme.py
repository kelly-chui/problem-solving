#!/usr/bin/env python3
"""Add links from README problem entries to matching solution files."""

from pathlib import Path
import re
import unicodedata
from urllib.parse import quote


README = Path("README.md")
IGNORED_DIRS = {".git", ".venv", "venv", "__pycache__", "node_modules"}
PLATFORM_DIRS = {
    "leetcode": "LeetCode",
    "codeforces": "CodeForces",
    "boj": "BOJ",
}
LANGUAGE_EXTENSIONS = {
    "Python": {".py"},
    "Swift": {".swift"},
    "C++": {".cpp", ".c"},
    "C": {".c"},
    "TypeScript": {".ts"},
    "SQL": {".sql"},
}
ENTRY_RE = re.compile(r"^(\s*- )(.*)$")
PROBLEM_RE = re.compile(r"(?i)\b(LeetCode|Codeforces|BOJ)\s*(\d+)")
PROGRAMMERS_RE = re.compile(r"^Programmers\s*:?[ ]*(.+?)\s+-\s+(.+?)(?:\s+▲)?$")


def solution_files() -> list[Path]:
    return [
        path
        for path in Path(".").rglob("*")
        if path.is_file() and not any(part in IGNORED_DIRS for part in path.parts)
    ]


def matches(files: list[Path], platform: str, number: str, language: str) -> list[Path]:
    platform_dir = PLATFORM_DIRS[platform.lower()]
    number_re = re.compile(
        rf"(?i)(?:leetcode|codeforces|boj)?[_-]?{re.escape(number)}(?=\D|$)"
    )
    extensions = LANGUAGE_EXTENSIONS.get(language, set())
    return [
        path
        for path in files
        if platform_dir.lower() in str(path).lower()
        and number_re.search(path.stem)
        and path.suffix in extensions
    ]


def normalize_title(title: str) -> str:
    normalized = unicodedata.normalize("NFKC", title).lower()
    return "".join(char for char in normalized if char.isalnum())


def programmer_matches(files: list[Path], title: str, language: str) -> list[Path]:
    extension = next(iter(LANGUAGE_EXTENSIONS.get(language, set())), None)
    if extension is None:
        return []
    normalized_title = normalize_title(title)
    return [
        path
        for path in files
        if any(part.lower() == "programmers" for part in path.parts)
        and path.suffix == extension
        and normalized_title in normalize_title(path.stem)
    ]


def link_entry(entry: str, files: list[Path]) -> str:
    if "](" in entry:
        return entry

    problem = PROBLEM_RE.search(entry)
    if not problem:
        programmer = PROGRAMMERS_RE.match(entry)
        if not programmer:
            return entry
        title, language_part = programmer.groups()
        links = []
        for language in language_part.split(","):
            for path in programmer_matches(files, title, language.strip()):
                target = quote(path.as_posix(), safe="/._-+")
                links.append(f"[{language.strip()}](./{target})")
        return f"{entry} — {', '.join(links)}" if links else entry

    platform, number = problem.groups()
    language_part = entry.rsplit(" - ", 1)[-1].replace(" ▲", "")
    languages = [language.strip() for language in language_part.split(",")]
    links = []

    for language in languages:
        for path in matches(files, platform, number, language):
            # Encode parentheses so Markdown parsers do not end the URL early.
            target = quote(path.as_posix(), safe="/._-+")
            links.append(f"[{language}](./{target})")

    if not links:
        return entry

    # Keep the original problem title and append one link per available language.
    title = entry
    if " - " in title:
        title = title.rsplit(" - ", 1)[0]
    return f"{title} — " + ", ".join(links)


def main() -> None:
    text = README.read_text(encoding="utf-8")
    files = solution_files()
    updated = []

    for line in text.splitlines(keepends=True):
        match = ENTRY_RE.match(line.rstrip("\n"))
        if not match:
            updated.append(line)
            continue
        newline = "\n" if line.endswith("\n") else ""
        updated.append(match.group(1) + link_entry(match.group(2), files) + newline)

    README.write_text("".join(updated), encoding="utf-8")


if __name__ == "__main__":
    main()
