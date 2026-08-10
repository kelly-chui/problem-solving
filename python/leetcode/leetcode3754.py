# https://leetcode.com/problems/concatenate-non-zero-digits-and-multiply-by-sum-i

class Solution:
    def sumAndMultiply(self, n: int) -> int:
        filtered = "".join(char for char in str(n) if char != "0")
        if not filtered:
            return 0
        return int(filtered) * sum(map(int, filtered))
