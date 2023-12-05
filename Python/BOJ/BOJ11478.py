import sys

s = sys.stdin.readline()
s_Count = len(s)
subStr = set()

for start in range(0, s_Count):
    for end in range(start, s_Count):
        subStr.add(s[start: end])
print(len(subStr) - 1)