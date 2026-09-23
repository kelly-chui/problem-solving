# https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero

class Solution:
    def minOperations(self, nums: list[int], x: int) -> int:
        target = sum(nums) - x
        if target < 0:
            return -1
        maxSubarrayLeng = -1
        start = 0
        cur = 0
        for end in range(len(nums)) :
            cur += nums[end]
            while cur > target:
                cur -= nums[start]
                start += 1
            if cur == target:
                maxSubarrayLeng = max(maxSubarrayLeng, end - start + 1)

        return len(nums) - maxSubarrayLeng if maxSubarrayLeng != -1 else -1
