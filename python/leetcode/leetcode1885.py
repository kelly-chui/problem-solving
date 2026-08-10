# https://leetcode.com/problems/maximum-distance-between-a-pair-of-values

class Solution:
    def maxDistance(self, nums1: List[int], nums2: List[int]) -> int:
        i = 0
        j = 0
        answer = 0
        while i < len(nums1) and j < len(nums2):
            if j < i:
                j = i
                if j >= len(nums2):
                    break
            if nums1[i] <= nums2[j]:
                answer = max(answer, j - i)
                j += 1
            else:
                i += 1
        return answer
