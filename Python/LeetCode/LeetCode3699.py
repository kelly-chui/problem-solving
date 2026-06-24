# https://leetcode.com/problems/number-of-zigzag-arrays-i

class Solution:
    def zigZagArrays(self, n: int, l: int, r: int) -> int:
        MOD = 10 ** 9 + 7
        m = r - l + 1
        dp = [[[0] * m for _ in range(2)] for _ in range(n + 1)]
        for x in range(m):
            dp[1][0][x] = 1
            dp[1][1][x] = 1
        for i in range(1, n):
            acc = 0
            for y in range(m):
                dp[i + 1][0][y] = acc
                acc = (acc + dp[i][1][y]) % MOD
            acc = 0
            for y in range(m - 1, -1, -1):
                dp[i + 1][1][y] = acc
                acc = (acc + dp[i][0][y]) % MOD
        return (sum(dp[n][0]) + sum(dp[n][1])) % MOD
