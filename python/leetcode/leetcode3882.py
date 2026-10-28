# https://leetcode.com/problems/minimum-xor-path-in-a-grid

class Solution:
    def minCost(self, grid: list[list[int]]) -> int:
        m, n = len(grid), len(grid[0])
        dp = [[set() for _ in range(n)] for _ in range(m)]
        dp[0][0].add(grid[0][0])

        for i in range(m):
            for j in range(n):
                if not dp[i][j]:
                    continue
                curr_xors = dp[i][j]
                if j + 1 < n:
                    next_val = grid[i][j + 1]
                    for x in curr_xors:
                        dp[i][j + 1].add(x ^ next_val)
                if i + 1 < m:
                    next_val = grid[i + 1][j]
                    for x in curr_xors:
                        dp[i + 1][j].add(x ^ next_val)

        return min(dp[m - 1][n - 1])
