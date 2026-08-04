#!/usr/bin/env python3
"""Add links from README problem entries to matching solution files."""

from pathlib import Path
import re
import unicodedata
from typing import Optional
from urllib.parse import quote


README = Path("README.md")
IGNORED_DIRS = {".git", ".venv", "venv", "__pycache__", "node_modules"}
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
ENTRY_RE = re.compile(r"^(\s*- )(.*)$")
PROBLEM_RE = re.compile(r"(?i)\b(LeetCode|Codeforces|BOJ)\s*(\d+)")
PROGRAMMERS_RE = re.compile(r"^Programmers\s*:?[ ]*(.+?)\s+-\s+(.+?)(?:\s+▲)?$")
FULL_LINK_RE = re.compile(r"^\[(.+)\]\((?:\./)?([^)]*)\)$")
LANGUAGE_LINK_RE = re.compile(r"\[([^\]]+)\]\((?:\./)?[^)]*\)")
LANGUAGE_RE = r"(?:Python|Swift|C\+\+|C|TypeScript|SQL)"
PROGRAMMERS_CANONICAL_RE = re.compile(
    rf"^(Programmers\s*:?.*?)\s+-\s+({LANGUAGE_RE}(?:,\s*{LANGUAGE_RE})*)"
    rf"(?:\s+-\s+{LANGUAGE_RE}(?:,\s*{LANGUAGE_RE})*)*$"
)


def solution_files() -> list[Path]:
    return [
        path
        for path in Path(".").rglob("*")
        if path.is_file() and not any(part in IGNORED_DIRS for part in path.parts)
    ]


def matches(files: list[Path], platform: str, number: str, language: str) -> list[Path]:
    platform_dir = PLATFORM_DIRS[platform.lower()]
    number_re = re.compile(
        rf"(?i)(?<!\d)(?:leetcode|codeforces|boj)?[_-]?{re.escape(number)}(?=\D|$)"
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
    extensions = LANGUAGE_EXTENSIONS.get(language, set())
    if not extensions:
        return []
    normalized_title = normalize_title(title)
    return [
        path
        for path in files
        if any(part.lower() == "programmers" for part in path.parts)
        and path.suffix in extensions
        and normalized_title in normalize_title(path.stem)
    ]


def language_for_path(path: str) -> Optional[str]:
    suffix = Path(path).suffix.lower()
    return next(
        (language for language, extensions in LANGUAGE_EXTENSIONS.items() if suffix in extensions),
        None,
    )


def plain_entry(entry: str) -> str:
    """Convert either supported README link format back to a canonical plain entry."""
    if " — " in entry and "](" in entry:
        title, link_part = entry.split(" — ", 1)
        languages = LANGUAGE_LINK_RE.findall(link_part)
        if languages:
            entry = f"{title} - {', '.join(dict.fromkeys(languages))}"

    full_link = FULL_LINK_RE.match(entry)
    if full_link:
        label, target = full_link.groups()
        entry = re.sub(r"\s+[—–]\s+", " - ", label)
        if " - " not in entry:
            language = language_for_path(target)
            entry = f"{entry} - {language}" if language else entry

    programmer = PROGRAMMERS_CANONICAL_RE.match(entry)
    if programmer:
        title, languages = programmer.groups()
        return f"{title} - {', '.join(dict.fromkeys(language.strip() for language in languages.split(',')))}"
    return entry


def link_entry(entry: str, files: list[Path]) -> str:
    entry = plain_entry(entry)

    problem = PROBLEM_RE.search(entry)
    if not problem:
        programmer = PROGRAMMERS_RE.match(entry)
        if not programmer:
            return entry
        title, language_part = programmer.groups()
        links = []
        for language in dict.fromkeys(language.strip() for language in language_part.split(",")):
            for path in programmer_matches(files, title, language):
                target = quote(path.as_posix(), safe="/._-+")
                links.append(f"[{language}](./{target})")
        return f"{entry} — {', '.join(links)}" if links else entry

    platform, number = problem.groups()
    language_part = entry.rsplit(" - ", 1)[-1].replace(" ▲", "")
    languages = list(dict.fromkeys(language.strip() for language in language_part.split(",")))
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
