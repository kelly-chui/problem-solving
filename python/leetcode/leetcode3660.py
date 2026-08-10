# https://leetcode.com/problems/jump-game-ix

class Solution:
    def maxValue(self, nums: List[int]) -> List[int]:
        n = len(nums)
        suffixMin = [float("inf")] * (n + 1)
        for i in range(n - 1, -1, -1):
            suffixMin[i] = min(nums[i], suffixMin[i + 1])
        ans = [0] * n
        start = 0
        currentMax = 0
        for i in range(n):
            currentMax = max(currentMax, nums[i])
            if i == n - 1 or currentMax <= suffixMin[i + 1]:
                for j in range(start, i + 1):
                    ans[j] = currentMax
                start = i + 1
                currentMax = 0
        return ans
