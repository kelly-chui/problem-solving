from pathlib import Path

TARGET_EXTENSIONS = {
    ".md",
    ".py",
    ".cpp",
    ".h",
    ".hpp",
    ".swift",
    ".sql",
}

IGNORE_DIRS = {
    ".git",
    ".vscode",
    ".tools",
}

IGNORE_FILES = {
    ".DS_Store",
}

fixed_count = 0

for path in Path(".").rglob("*"):
    if not path.is_file():
        continue

    if any(part in IGNORE_DIRS for part in path.parts):
        continue

    if path.name in IGNORE_FILES:
        continue

    if path.suffix not in TARGET_EXTENSIONS:
        continue

    content = path.read_bytes()

    if content.endswith(b"\n"):
        continue

    path.write_bytes(content + b"\n")
    fixed_count += 1
    print(f"fixed: {path}")

print(f"Fixed {fixed_count} file(s).")
