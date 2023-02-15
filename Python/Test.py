import sys

x = list(map(int, sys.stdin.readline().lstrip("[").rstrip("]\n").split(",")))
print(x)