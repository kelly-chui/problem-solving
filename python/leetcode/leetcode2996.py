# https://leetcode.com/problems/smallest-missing-integer-greater-than-sequential-prefix-sum

class Solution:
    def missingInteger(self, nums: List[int]) -> int:
        answer = nums[0]
        for idx in range(1, len(nums)):
            if nums[idx - 1] + 1 == nums[idx]:
                answer += nums[idx]
            else:
                break
        while answer in nums:
            answer += 1
        return answer
