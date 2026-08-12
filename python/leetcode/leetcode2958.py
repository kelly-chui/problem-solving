# https://leetcode.com/problems/length-of-longest-subarray-with-at-most-k-frequency

class Solution:
    def maxSubarrayLength(self, nums: List[int], k: int) -> int:
        numFrequencies = {}
        start = 0
        end = 0
        answer = 0
        while end < len(nums):
            num = nums[end]
            numFrequencies[num] = numFrequencies.get(num, 0) + 1
            while numFrequencies[num] > k:
                numFrequencies[nums[start]] -= 1
                start += 1
            answer = max(answer, end - start + 1)
            end += 1
        return answer
