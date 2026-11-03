# https://leetcode.com/problems/minimum-moves-to-equal-array-elements-iii

class Solution:
    def minMoves(self, nums: List[int]) -> int:
        maxValue = max(nums)
        return sum(maxValue - x for x in nums)
