# https://leetcode.com/problems/smallest-missing-multiple-of-k

class Solution:
    def missingMultiple(self, nums: List[int], k: int) -> int:
        numsSet = set(nums)
        factor = 1
        while factor * k in numsSet:
            factor += 1
        return factor * k
