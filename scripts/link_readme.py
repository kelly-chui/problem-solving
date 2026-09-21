#!/usr/bin/env python3
"""Add links from README problem entries to matching solution files."""

from pathlib import Path
import re
import unicodedata
from typing import Optional
from urllib.parse import quote

README = Path("README.md")

IGNORED_DIRS = {
    ".git",
    ".venv",
    "venv",
    "__pycache__",
    "node_modules",
}

PLATFORM_DIRS = {
    "leetcode": "leetcode",
    "codeforces": "codeforces",
    "boj": "boj",
}

LANGUAGE_EXTENSIONS = {
    "Python": {".py"},
    "Swift": {".swift"},
    "C++": {".cpp", ".cc", ".cxx"},
    "C": {".c"},
    "TypeScript": {".ts"},
    "SQL": {".sql"},
}

ENTRY_RE = re.compile(r"^(\s*\- )(.*)$")

PROBLEM_RE = re.compile(
    r"(?i)\b(LeetCode|Codeforces|BOJ)\s*(\d+)"
)

PROGRAMMERS_RE = re.compile(
    r"^Programmers\s*:?\s*(.+)$",
    re.IGNORECASE,
)

LANGUAGE_LINK_RE = re.compile(
    r"\[([^\]]+)\]\((?:\./)?[^)]*\)"
)

LANGUAGE_RE = re.compile(
    r"(?:Python|Swift|C\+\+|C|TypeScript|SQL)"
)


def solution_files() -> list[Path]:
    return [
        path
        for path in Path(".").rglob("*")
        if path.is_file()
        and not any(part in IGNORED_DIRS for part in path.parts)
    ]


def normalize_title(title: str) -> str:
    normalized = unicodedata.normalize("NFKC", title).lower()

    return "".join(
        char
        for char in normalized
        if char.isalnum()
    )


def language_for_path(path: str) -> Optional[str]:
    suffix = Path(path).suffix.lower()

    return next(
        (
            language
            for language, extensions in LANGUAGE_EXTENSIONS.items()
            if suffix in extensions
        ),
        None,
    )


def problem_matches(
    files: list[Path],
    platform: str,
    number: str,
    language: str,
) -> list[Path]:

    platform_dir = PLATFORM_DIRS[platform.lower()]

    number_re = re.compile(
        rf"(?i)"
        rf"(?<!\d)"
        rf"(?:leetcode|codeforces|boj)?"
        rf"[_-]?"
        rf"{re.escape(number)}"
        rf"(?=\D|$)"
    )

    extensions = LANGUAGE_EXTENSIONS.get(language, set())

    return [
        path
        for path in files
        if platform_dir.lower() in str(path).lower()
        and number_re.search(path.stem)
        and path.suffix.lower() in extensions
    ]


def programmers_matches(
    files: list[Path],
    title: str,
    language: str,
) -> list[Path]:

    extensions = LANGUAGE_EXTENSIONS.get(language, set())

    if not extensions:
        return []

    normalized_title = normalize_title(title)

    return [
        path
        for path in files
        if any(part.lower() == "programmers" for part in path.parts)
        and path.suffix.lower() in extensions
        and normalized_title in normalize_title(path.stem)
    ]


def plain_entry(entry: str) -> str:
    """
    Convert an already-linked README entry back into:

        Problem title - Swift, Python
    """

    if " — " not in entry:
        return entry

    title, links = entry.split(" — ", 1)

    languages = LANGUAGE_LINK_RE.findall(links)

    if not languages:
        return entry

    languages = list(dict.fromkeys(languages))

    return f"{title} - {', '.join(languages)}"


def parse_entry(
    entry: str,
) -> Optional[tuple[str, list[str]]]:
    """
    Return:

        (problem title, languages)

    Examples:

        LeetCode 1. Two Sum - Swift, Python
            ->
        ("LeetCode 1. Two Sum", ["Swift", "Python"])

        Programmers: 두 수의 합 - Swift
            ->
        ("Programmers: 두 수의 합", ["Swift"])
    """

    if " - " not in entry:
        return None

    title, language_part = entry.rsplit(" - ", 1)

    language_part = language_part.replace(" ▲", "")

    languages = [
        language.strip()
        for language in language_part.split(",")
        if language.strip() in LANGUAGE_EXTENSIONS
    ]

    if not languages:
        return None

    return title, list(dict.fromkeys(languages))


def find_matches(
    files: list[Path],
    title: str,
    language: str,
) -> list[Path]:

    problem = PROBLEM_RE.search(title)

    if problem:
        platform, number = problem.groups()

        return problem_matches(
            files,
            platform,
            number,
            language,
        )

    programmer = PROGRAMMERS_RE.match(title)

    if programmer:
        programmer_title = programmer.group(1)

        return programmers_matches(
            files,
            programmer_title,
            language,
        )

    return []


def link_entry(
    entry: str,
    files: list[Path],
) -> str:

    entry = plain_entry(entry)

    parsed = parse_entry(entry)

    if not parsed:
        return entry

    title, languages = parsed

    links = []

    for language in languages:
        paths = find_matches(
            files,
            title,
            language,
        )

        for path in paths:
            target = quote(
                path.as_posix(),
                safe="/._-+",
            )

            links.append(
                f"[{language}](./{target})"
            )

    if not links:
        return entry

    return f"{title} — {', '.join(links)}"


def main() -> None:
    text = README.read_text(encoding="utf-8")

    files = solution_files()

    updated = []

    for line in text.splitlines(keepends=True):
        match = ENTRY_RE.match(
            line.rstrip("\n")
        )

        if not match:
            updated.append(line)
            continue

        newline = "\n" if line.endswith("\n") else ""

        updated.append(
            match.group(1)
            + link_entry(
                match.group(2),
                files,
            )
            + newline
        )

    README.write_text(
        "".join(updated),
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
