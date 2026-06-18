from pathlib import Path
import re
from collections import OrderedDict

README = Path("README.md")

MONTHS = {
    "January": "Jan", "February": "Feb", "March": "Mar", "April": "Apr",
    "May": "May", "June": "Jun", "July": "Jul", "August": "Aug",
    "September": "Sep", "October": "Oct", "November": "Nov", "December": "Dec",
}

year_re = re.compile(r"<b>(\d{4})</b>")
month_re = re.compile(r"<b>([A-Z][a-z]+) (\d{4})</b>")
date_re = re.compile(r"^### ([A-Z][a-z]+) (\d{1,2})(?:, (\d{4}))?$")
problem_re = re.compile(r"^- ")

def normalized_month(month: str) -> str:
    return MONTHS.get(month, month)

def add_problem(data, year, month, date, problem):
    data.setdefault(year, OrderedDict())
    data[year].setdefault(month, OrderedDict())
    data[year][month].setdefault(date, [])
    data[year][month][date].append(problem)

def parse_readme(text: str):
    lines = text.splitlines()

    preamble = []
    data = OrderedDict()

    current_year = None
    current_month = None
    current_date = None
    seen_first_year = False

    for line in lines:
        year_match = year_re.search(line)
        month_match = month_re.search(line)

        if year_match and not month_match:
            current_year = year_match.group(1)
            current_month = None
            current_date = None
            seen_first_year = True
            continue

        if not seen_first_year:
            preamble.append(line)
            continue

        if month_match:
            current_month = normalized_month(month_match.group(1))
            current_year = month_match.group(2)
            current_date = None
            continue

        date_match = date_re.match(line)
        if date_match:
            month = normalized_month(date_match.group(1))
            day = date_match.group(2)

            if current_year is None and date_match.group(3):
                current_year = date_match.group(3)

            current_month = month
            current_date = f"{month} {day}"
            continue

        if current_year and current_month and current_date and problem_re.match(line):
            add_problem(data, current_year, current_month, current_date, line[2:])

    return preamble, data

def month_count(dates):
    return sum(len(problems) for problems in dates.values())

def year_count(months):
    return sum(month_count(dates) for dates in months.values())

def render_readme(preamble, data):
    result = []

    while preamble and preamble[-1] == "":
        preamble.pop()

    result.extend(preamble)
    result.append("")

    for year, months in data.items():
        result.append(f"## {year}")
        result.append("")

        for month, dates in months.items():
            result.append("<details>")
            result.append(f"  <summary><b>{month}</b></summary>")
            result.append("")

            for date, problems in dates.items():
                result.append(f"- {date}")

                for problem in problems:
                    result.append(f"  - {problem}")

                result.append("")

            result.append("</details>")
            result.append("")

    return "\n".join(result).rstrip() + "\n"

def main():
    text = README.read_text(encoding="utf-8")
    preamble, data = parse_readme(text)
    README.write_text(render_readme(preamble, data), encoding="utf-8")

if __name__ == "__main__":
    main()
