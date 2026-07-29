# https://leetcode.com/problems/smallest-palindromic-rearrangement-ii

from math import factorial

class Solution:
    def smallestPalindrome(self, s: str, k: int) -> str:
        countTable = {}
        for char in s:
            countTable[char] = countTable.get(char, 0) + 1
        center = ""
        halfTable = {}
        for char, count in countTable.items():
            if count % 2 == 1:
                center = char
            if count // 2 > 0:
                halfTable[char] = count // 2
        halfLength = len(s) // 2
        totalCount = factorial(halfLength)
        for count in halfTable.values():
            totalCount //= factorial(count)
        if totalCount < k:
            return ""
        chars = sorted(halfTable)
        half = []
        for remaining in range(halfLength, 0, -1):
            for char in chars:
                charCount = halfTable.get(char, 0)
                if charCount == 0:
                    continue
                nextCount = totalCount * charCount // remaining
                if nextCount >= k:
                    half.append(char)
                    halfTable[char] -= 1
                    totalCount = nextCount
                    break
                k -= nextCount
        half = "".join(half)
        return half + center + half[::-1]
