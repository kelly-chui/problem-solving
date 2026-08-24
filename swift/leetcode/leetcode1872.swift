# https://leetcode.com/problems/stone-game-viii

class Solution:
    def stoneGameVIII(self, stones: List[int]) -> int:
        n = len(stones)
        prefix = [stones[0]]
        for i in range(1, n):
            prefix.append(prefix[i - 1] + stones[i])
        prev = prefix[n - 1]
        for i in range(n - 2, 0, -1):
            prev = max(prev, prefix[i] - prev)
        return prev
