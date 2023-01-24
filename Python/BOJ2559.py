import sys

n, k = map(int, sys.stdin.readline().split())
temperatures = list(map(int, sys.stdin.readline().split()))

for i in range(1, n):
    temperatures[i] = temperatures[i - 1] + temperatures[i]

start = 0
ans = temperatures[k - 1]
for i in range(0, n - k):
    if ans < temperatures[i + k] - temperatures[i]:
        ans = temperatures[i + k] - temperatures[i]
print(ans)