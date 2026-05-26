# https://leetcode.com/problems/jump-game-vii

from collections import deque

class Solution:
    def canReach(self, s: str, minJump: int, maxJump: int) -> bool:
        n = len(s)
        if s[-1] == "1":
            return False
        dp = [False] * n
        dp[0] = True
        prefix = [0] * n
        prefix[0] = 1
        for i in range(1, n):
            if s[i] == "1":
                prefix[i] = prefix[i - 1]
                continue
            left = max(0, i - maxJump)
            right = i - minJump
            if right >= 0:
                reachableCount = prefix[right]
                if left > 0:
                    reachableCount -= prefix[left - 1]
                if reachableCount > 0:
                    dp[i] = True
            prefix[i] = prefix[i - 1] + (1 if dp[i] else 0)
        return dp[-1]
