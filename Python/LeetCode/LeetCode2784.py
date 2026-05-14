# https://leetcode.com/problems/check-if-array-is-good

class Solution:
    def isGood(self, nums: List[int]) -> bool:
        n = len(nums) - 1
        base = list(range(1, n + 1)) + [n]
        return sorted(nums) == base
    