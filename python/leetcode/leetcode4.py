# https://leetcode.com/problems/median-of-two-sorted-arrays

class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        INF = 987654321
        if len(nums1) < len(nums2):
            a, b = nums1, nums2
            m, n = len(nums1), len(nums2)
        else:
            a, b = nums2, nums1
            m, n = len(nums2), len(nums1)
        totalSize = m + n
        answer = 0
        start = 0
        end = m
        while start <= end:
            pA = (start + end) // 2
            pB = ((totalSize + 1) // 2) - pA
            aR = a[pA] if pA < m else INF
            aL = a[pA - 1] if pA > 0 else -INF
            bR = b[pB] if pB < n else INF
            bL = b[pB - 1] if pB > 0 else -INF
            if aL <= bR and bL <= aR:
                if totalSize % 2 == 0:
                    answer = (max(aL, bL) + min(aR, bR)) / 2
                else:
                    answer = max(aL, bL)
                break
            elif aL > bR:
                end = pA - 1
            elif bL > aR:
                start = pA + 1
        return answer
