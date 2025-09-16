n, k = map(int, input().split())
wList = []
vList = []
for _ in range(n):
    w, v = map(int, input().split())
    wList.append(w)
    vList.append(v)
dp = [[0] * (k + 1) for _ in range(n + 1)]
for i in range(1, n + 1):
    w, v = wList[i - 1], vList[i - 1]
    for c in range(k + 1):
        dp[i][c] = dp[i - 1][c]
        if c >= w:
            dp[i][c] = max(dp[i][c], dp[i - 1][c - w] + v)
print(dp[n][k])
