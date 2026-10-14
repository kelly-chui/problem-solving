# https://leetcode.com/problems/maximize-sum-of-squares-of-digits

class Solution:
    def maxSumOfSquares(self, num: int, sum: int) -> str:
        if num * 9 < sum:
            return ""
        nineCount = sum // 9
        lastNonZero = sum % 9
        answer = "9" * nineCount + (str(lastNonZero) if lastNonZero else "")
        return answer.ljust(num, "0")
