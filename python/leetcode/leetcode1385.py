# https://leetcode.com/problems/find-the-distance-value-between-two-arrays

class Solution:
    def findTheDistanceValue(self, arr1: list[int], arr2: list[int], d: int) -> int:
        answer = 0
        for arr1Element in arr1:
            for arr2Element in arr2:
                if abs(arr1Element - arr2Element) <= d:
                    break
            else:
                answer += 1
        return answer
