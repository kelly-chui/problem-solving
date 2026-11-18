# https://leetcode.com/problems/minimum-changes-to-make-k-semi-palindromes

class Solution:
    def minimumChanges(self, s: str, k: int) -> int:
        def getDivisors(strLength: int) -> list[int]:
            divisors = []
            for divisor in range(1, strLength):
                if strLength % divisor == 0:
                    divisors.append(divisor)
            return divisors

        def minChangesToSemiPalindrome(sub: str) -> int:
            n = len(sub)
            min_changes = float("inf")
            for d in getDivisors(n):
                changes = 0
                groups = [sub[i::d] for i in range(d)]
                for g in groups:
                    for i in range(len(g) // 2):
                        if g[i] != g[-(i + 1)]:
                            changes += 1
                min_changes = min(min_changes, changes)
            
            return min_changes
        
        strLength = len(s)
        v = [[0] * strLength for _ in range(strLength)]
        for i in range(strLength):
            for j in range(i + 1, strLength):
                v[i][j] = minChangesToSemiPalindrome(s[i:j+1])
        
        dp = [[float("inf")] * (k + 1) for _ in range(strLength + 1)]
        for i in range(strLength - 1):
            dp[i][1] = v[i][strLength - 1]
        for j in range(2, k + 1):
            for i in range(strLength - 2 * j + 1):
                for x in range(i + 1, strLength - 2 * (j - 1)):
                    dp[i][j] = min(
                        dp[i][j],
                        v[i][x] + dp[x + 1][j - 1]
                    )
        return dp[0][k]
