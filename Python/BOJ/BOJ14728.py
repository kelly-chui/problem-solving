n, t = map(int, input().split())
kList = []
sList = []
for i in range(n):
    k, s = map(int, input().split())
    kList.append(k)
    sList.append(s)
dp = [[0] * (t + 1) for _ in range(n + 1)]
for i in range(1, n + 1):
    k, s = kList[i - 1], sList[i - 1]
    for c in range(t + 1):
        dp[i][c] = dp[i - 1][c]
        if c >= k:
            dp[i][c] = max(dp[i][c], dp[i - 1][c - k] + s)
print(dp[n][t])