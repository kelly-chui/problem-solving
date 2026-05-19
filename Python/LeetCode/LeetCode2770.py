# https://leetcode.com/problems/maximum-number-of-jumps-to-reach-the-last-index

class Solution:
    def maximumJumps(self, nums: List[int], target: int) -> int:
        n = len(nums)
        dp = [-1] * n
        dp[0] = 0
        for i in range(1, n):
            for j in range(0, i):
                if dp[j] != -1 and abs(nums[j] - nums[i]) <= target:
                    dp[i] = dp[j] + 1 if dp[j] + 1 > dp[i] else dp[i]
        return dp[n - 1]
