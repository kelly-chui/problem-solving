# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii

class Solution:
    def findMin(self, nums: List[int]) -> int:
        n = len(nums)
        start = 0
        end = n - 1
        while start < end:
            mid = (start + end) // 2
            if nums[mid] < nums[end]:
                end = mid
            elif nums[mid] > nums[end]:
                start = mid + 1
            else:
                end -= 1
        return nums[start]
