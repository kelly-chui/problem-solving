import sys

n, k = map(int, sys.stdin.readline().split())
circle = list(range(1, n + 1))
curIdx = 0
answer = []
while circle:
    newIdx = (curIdx + k - 1) % len(circle)
    answer.append(circle.pop(newIdx))
    curIdx = newIdx

print("<", end = "")
for i in range(len(answer)):
    print(answer[i], end = ", " if i != len(answer) - 1 else ">")