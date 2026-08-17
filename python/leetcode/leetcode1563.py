# https://leetcode.com/problems/stone-game-v

class Solution:
    def stoneGameV(self, stoneValue: List[int]) -> int:
        n = len(stoneValue)
        prefix = [0] * (n + 1)
        for i in range(n):
            prefix[i + 1] = prefix[i] + stoneValue[i]
        dp = [[None] * n for _ in range(n)]
        def solve(left, right):
            if left == right:
                return 0
            if dp[left][right] is not None:
                return dp[left][right]
            best_score = 0
            for split in range(left, right):
                left_sum = prefix[split + 1] - prefix[left]
                right_sum = prefix[right + 1] - prefix[split + 1]
                if left_sum < right_sum:
                    score = left_sum + solve(left, split)
                elif left_sum > right_sum:
                    score = right_sum + solve(split + 1, right)
                else:
                    score = left_sum + max(
                        solve(left, split),
                        solve(split + 1, right)
                    )
                best_score = max(best_score, score)
            dp[left][right] = best_score
            return best_score
        return solve(0, n - 1)
            