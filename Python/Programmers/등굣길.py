def solution(m, n, puddles):
    MOD = 1000000007
    graph = [[True] * m for i in range(n)]
    for puddle in puddles:
        graph[puddle[1] - 1][puddle[0] - 1] = False
    dp = [[0] * m for i in range(n)]
    
    for col in range(m):
        if graph[0][col]:
            dp[0][col] = 1
        else:
            break
    for row in range(n):
        if graph[row][0]:
            dp[row][0] = 1
        else:
            break
    for row in range(1, n):
        for col in range(1, m):
            if not graph[row][col]:
                continue
            dp[row][col] = (dp[row - 1][col] + dp[row][col - 1]) % MOD
    return dp[n - 1][m - 1]
