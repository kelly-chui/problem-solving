def solution(triangle):
    dp = [[0] * len(triangle) for i in range(len(triangle[-1]))]
    dp[0][0] = triangle[0][0]
    if len(triangle) == 1:
        return dp[0][0]
    for i in range(1, len(triangle)):
        for j in range(len(triangle[i])):
            if j != 0:
                dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + triangle[i][j]
            else:
                dp[i][j] = dp[i - 1][j] + triangle[i][j]
    return max(dp[-1])
