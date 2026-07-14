# https://leetcode.com/problems/find-the-number-of-subsequences-with-equal-gcd

class Solution:
    def subsequencePairCount(self, nums: List[int]) -> int:
        MOD = 10 ** 9 + 7
        dp = [[0] * 201 for _ in range(201)]
        dp[0][0] = 1
        for num in nums:
            newDP = [[0] * 201 for _ in range(201)]
            for g1 in range(201):
                for g2 in range(201):
                    if dp[g1][g2] == 0:
                        continue
                    newDP[g1][g2] = (newDP[g1][g2] + dp[g1][g2]) % MOD
                    newDP[gcd(g1, num)][g2] = (newDP[gcd(g1, num)][g2] + dp[g1][g2]) % MOD
                    newDP[g1][gcd(g2, num)] = (newDP[g1][gcd(g2, num)] + dp[g1][g2]) % MOD
            dp = newDP
        return sum(dp[i][i] for i in range(1, 201)) % MOD
                    