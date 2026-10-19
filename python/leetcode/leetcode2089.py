# https://leetcode.com/problems/find-target-indices-after-sorting-array

class Solution:
    def targetIndices(self, nums: list[int], target: int) -> list[int]:
        answer = []
        nums.sort()
        for i in range(len(nums)):
            if nums[i] == target:
                answer.append(i)
        return answer 
