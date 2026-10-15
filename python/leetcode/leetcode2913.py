# https://leetcode.com/problems/subarrays-distinct-element-sum-of-squares-i

class Solution:
    def sumCounts(self, nums: List[int]) -> int:
        answer = 0
        for start in range(len(nums)):
            frequencies = {}
            for end in range(start, len(nums)):
                frequencies[nums[end]] = frequencies.get(nums[end], 0) + 1
                answer += len(frequencies) ** 2
        return answer
