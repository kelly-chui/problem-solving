t = int(input())
for _ in range(t):
    n = int(input())
    coins = map(int, input().split())
    m = int(input())
    dp = [0] * (m + 1)
    dp[0] = 1

    for coin in coins:
        for a in range(coin, m + 1):
            dp[a] += dp[a - coin ]
    print(dp[m])