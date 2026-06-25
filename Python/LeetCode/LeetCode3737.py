# https://leetcode.com/problems/count-subarrays-with-majority-element-i

class Solution:
    def countMajoritySubarrays(self, nums: List[int], target: int) -> int:
        answer = 0
        for left in range(len(nums)):
            targetCount = 0
            for right in range(left, len(nums)):
                if nums[right] == target:
                    targetCount += 1
                if (right - left + 1) / 2 < targetCount:
                    answer += 1
        return answer
