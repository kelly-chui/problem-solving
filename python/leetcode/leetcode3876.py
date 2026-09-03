# https://leetcode.com/problems/construct-uniform-parity-array-ii

class Solution:
    def uniformArray(self, nums1: list[int]) -> bool:
        smallestEven = float("inf")
        smallestOdd = float("inf")
        for num in nums1:
            if num % 2 == 0 and num < smallestEven:
                smallestEven = num
            elif num % 2 != 0 and num < smallestOdd:
                smallestOdd = num
        isOddPossible = True
        isEvenPossible = True
        for num in nums1:
            if num % 2 != 0:
                if num <= smallestOdd:
                    isEvenPossible = False
                    break
        for num in nums1:
            if num % 2 == 0:
                if num < smallestOdd:
                    isOddPossible = False
        return isEvenPossible or isOddPossible
