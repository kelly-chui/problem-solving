# https://leetcode.com/problems/rotate-function

class Solution:
    def maxRotateFunction(self, nums: List[int]) -> int:
        n = len(nums)
        totalSum = sum(nums)
        current = sum(i * nums[i] for i in range(n))
        answer = current
        for i in range(1, n):
            current = current + totalSum - (n * nums[n - i])
            answer = answer if answer > current else current
        return answer
