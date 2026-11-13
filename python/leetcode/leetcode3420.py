# https://leetcode.com/problems/count-non-decreasing-subarrays-after-k-operations

from collections import deque

class Solution:
    def countNonDecreasingSubarrays(self, nums: List[int], k: int) -> int:
        length = len(nums)
        groups = deque()
        cost = 0
        answer = 0
        right = length - 1
        for left in range(length - 1, -1, -1):
            current = nums[left]
            count = 1
            while groups and groups[0][0] <= current:
                value, groupCount = groups.popleft()
                cost += (current - value) * groupCount
                count += groupCount
            groups.appendleft([current, count])
            while cost > k:
                value, groupCount = groups[-1]
                cost -= value - nums[right]
                if groupCount == 1:
                    groups.pop()
                else:
                    groups[-1][1] -= 1
                right -= 1
            answer += right - left + 1

        return answer
