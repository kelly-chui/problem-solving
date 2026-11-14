# https://leetcode.com/problems/minimum-positive-sum-subarray

class Solution:
    def minimumSumSubarray(self, nums: List[int], l: int, r: int) -> int:
        answer = float("INF")

        for start in range(len(nums)):
            currentSum = 0
            for end in range(start + 1, min(len(nums), start + r) + 1):
                currentSum += nums[end - 1]
                length = end - start
                if l <= length and length <= r and currentSum > 0:
                    answer = min(answer, currentSum)

        return -1 if answer == float("INF") else answer
