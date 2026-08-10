# https://leetcode.com/problems/find-missing-elements

class Solution:
    def findMissingElements(self, nums: List[int]) -> List[int]:
        numsSet = set(nums)
        answer = []
        for num in range(min(nums) + 1, max(nums)):
            if not num in numsSet:
                answer.append(num)
        return answer
