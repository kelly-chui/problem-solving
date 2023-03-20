import sys
n, m = map(int, sys.stdin.readline().split())
dp = [[999_999_999] * (n + 1) for _ in range(n + 1)]
for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    dp[a][b] = 1
    dp[b][a] = 1

for i in range(1, n + 1):
    dp[i][i] = 0

for m in range(1, n + 1):
    for a in range(1, n + 1):
        for b in range(1, n + 1):
            if dp[a][b] > dp[a][m] + dp[m][b]:
                dp[a][b] = dp[a][m] + dp[m][b]

minK = 999_999_999
minNumber = 1
for idx in range(1, n + 1):
    if minK > sum(dp[idx][1:]):
        minK = sum(dp[idx][1:])
        minNumber = idx

print(minNumber)
    