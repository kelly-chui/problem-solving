# https://leetcode.com/problems/stone-removal-game

class Solution:
    def canAliceWin(self, n: int) -> bool:
        remaining = n
        for pick in range(10, 0, -1):
            remaining -= pick
            if remaining < 0:
                return pick % 2 != 0
