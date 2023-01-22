n, m = map(int, input().split())
seq = list(map(int, input().split()))

for i in range(1, n):
    seq[i] = seq[i - 1] + seq[i]

for _ in range(m):
    start, end = map(int, input().split())
    if start == 1:
        print(seq[end - 1])
    else:
        print(seq[end - 1] - seq[start - 2])