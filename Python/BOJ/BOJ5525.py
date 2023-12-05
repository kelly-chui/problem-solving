import sys
from collections import deque

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())
s = sys.stdin.readline()

p = "I"
for i in range(n):
    p = p + "O" + "I"

count = 0
queue = deque(s[0: len(p)])

for i in range(len(p), len(s) - n):
    queue.popleft()
    queue.append(s[i])
    if queue[-1] == "O":
        continue
    if queue == deque(p):
        count += 1

print(count)
