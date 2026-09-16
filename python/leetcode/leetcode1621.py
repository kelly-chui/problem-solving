# https://leetcode.com/problems/number-of-sets-of-k-non-overlapping-line-segments

class Solution:
    def numberOfSets(self, n: int, k: int) -> int:
        MOD = 10 ** 9 + 7
        return math.comb(n - 1 + k, 2 * k) % MOD
