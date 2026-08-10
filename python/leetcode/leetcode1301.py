# https://leetcode.com/problems/number-of-paths-with-max-score

class Solution:
    def pathsWithMaxScore(self, board: List[str]) -> List[int]:
        MOD = 1000000007
        n = len(board)
        dpMax = [[-1] * n for _ in range(n)]
        dpCount = [[0] * n for _ in range(n)]
        dpMax[n - 1][n - 1] = 0
        dpCount[n - 1][n - 1] = 1
        for row in range(n - 1, -1, -1):
            for col in range(n - 1, -1, -1):
                if (row, col) == (n - 1, n - 1):
                    continue
                if board[row][col] == "X":
                    continue
                curValue = int(board[row][col]) if board[row][col].isdigit() else 0
                downValue = dpMax[row + 1][col] if row + 1 < n else -1
                rightValue = dpMax[row][col + 1] if col + 1 < n else -1
                downRightValue = dpMax[row + 1][col + 1] if row + 1 < n and col + 1 < n else -1
                maxValue = max(downValue, rightValue, downRightValue)
                if maxValue == -1:
                    continue
                dpMax[row][col] = maxValue + curValue
                if maxValue == downValue:
                    dpCount[row][col] += dpCount[row + 1][col]
                if maxValue == rightValue:
                    dpCount[row][col] += dpCount[row][col + 1]
                if maxValue == downRightValue:
                    dpCount[row][col] += dpCount[row + 1][col + 1]
                dpCount[row][col] %= MOD
        if dpMax[0][0] == -1:
            return [0, 0]
        return [dpMax[0][0], dpCount[0][0] % MOD]
