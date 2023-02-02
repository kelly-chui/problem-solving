import sys

n, m = map(int, sys.stdin.readline().split())
seq = list(map(int, sys.stdin.readline().split()))

for i in range(1, n):
    seq[i] = seq[i - 1] + seq[i]

for _ in range(m):
    start, end = map(int, sys.stdin.readline().split())
    if start == 1:
        print(seq[end - 1])
    else:
        print(seq[end - 1] - seq[start - 2])
        