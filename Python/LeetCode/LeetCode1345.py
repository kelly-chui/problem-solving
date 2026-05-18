# https://leetcode.com/problems/jump-game-iv

from collections import deque

class Solution:
    def minJumps(self, arr: List[int]) -> int:
        n = len(arr)
        if n == 1:
            return 0
        arrValueDict = {}
        for idx, value in enumerate(arr):
            if value not in arrValueDict:
                arrValueDict[value] = []
            arrValueDict[value].append(idx)
        n = len(arr)
        queue = deque()
        queue.append(0)
        jumpCount = [-1] * n
        jumpCount[0] = 0
        while queue:
            i = queue.popleft()
            for candidate in arrValueDict[arr[i]] + [i + 1, i - 1]:
                if candidate == n - 1:
                    return jumpCount[i] + 1
                if candidate == i:
                    continue
                if candidate < 0 or candidate >= n:
                    continue
                if jumpCount[candidate] != -1:
                    continue
                queue.append(candidate)
                jumpCount[candidate] = jumpCount[i] + 1
            arrValueDict[arr[i]].clear()
        return -1
