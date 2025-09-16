nw = int(input())
weights = list(map(int, input().split()))
nb = int(input())
beads = list(map(int, input().split()))

s = sum(weights)
dp = [False] * (s + 1)
dp[0] = True
s = sum(weights)

dp = [[False] * (s + 1) for _ in range(nw + 1)]
dp[0][0] = True

for i in range(1, nw + 1):
    w = weights[i - 1]
    prev = dp[i - 1]
    cur = dp[i]
    for d in range(s + 1):
        if not prev[d]:
            continue
        cur[d] = True
        if d + w <= s:
            cur[d + w] = True
        cur[abs(d - w)] = True

ans = []
for x in beads:
    ans.append('Y' if x <= s and dp[nw][x] else 'N')
print(' '.join(ans))