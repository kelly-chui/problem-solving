# https://leetcode.com/problems/maximum-score-from-grid-operations

class Solution:
    def maximumScore(self, grid: List[List[int]]) -> int:
        n = len(grid)
        if n == 1:
            return 0
        prefixSumTable = [[0] * n for _ in range(n)]
        for row in range(n):
            for col in range(n):
                if row == 0:
                    prefixSumTable[row][col] = grid[row][col]
                else:
                    prefixSumTable[row][col] = prefixSumTable[row - 1][col] + grid[row][col]

        def rangeSum(start: int, end: int, col: int):
            if start > end:
                return 0
            if start == 0:
                return prefixSumTable[end][col]
            return prefixSumTable[end][col] - prefixSumTable[start - 1][col]
        def score(col: int, h: int, neighborMax: int):
            return rangeSum(h, neighborMax - 1, col)
        NEG = float("-inf")
        dp = [[NEG] * (n + 1) for _ in range(n + 1)]
        for h0 in range(n + 1):
            for h1 in range(n + 1):
                dp[h0][h1] = score(0, h0, h1)
        for col in range(1, n - 1):
            nextDp = [[NEG] * (n + 1) for _ in range(n + 1)]
            for currH in range(n + 1):
                prefixBest = [NEG] * (n + 1)
                best = NEG
                for leftH in range(n + 1):
                    best = max(best, dp[leftH][currH])
                    prefixBest[leftH] = best
                suffixBest = [NEG] * (n + 2)
                for leftH in range(n, -1, -1):
                    suffixBest[leftH] = max(
                        suffixBest[leftH + 1],
                        dp[leftH][currH] + score(col, currH, leftH)
                    )
                for rightH in range(n + 1):
                    case1 = prefixBest[rightH] + score(col, currH, rightH)
                    case2 = suffixBest[rightH + 1]
                    nextDp[currH][rightH] = max(case1, case2)
            dp = nextDp
        answer = 0
        for leftH in range(n + 1):
            for currH in range(n + 1):
                answer = max(
                    answer,
                    dp[leftH][currH] + score(n - 1, currH, leftH)
                )
        return answer