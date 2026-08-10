def solution(n, money):
    mod = 1000000007
    dp = [0] * (n + 1)
    dp[0] = 1
    
    for coin in money:
        for amount in range(coin, n + 1):
            dp[amount] = (dp[amount] + dp[amount - coin]) % mod
    return dp[n]
