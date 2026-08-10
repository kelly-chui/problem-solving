# https://leetcode.com/problems/minimum-element-after-replacement-with-digit-sum

class Solution:
    def minElement(self, nums: List[int]) -> int:
        return min(sum(map(int, str(num))) for num in nums)
