# https://leetcode.com/problems/minimum-moves-to-equal-array-elements

class Solution:
    def minMoves(self, nums: list[int]) -> int:
        minValue = min(nums)
        return sum(x - minValue for x in nums)
