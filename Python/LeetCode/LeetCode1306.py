# https://leetcode.com/problems/jump-game-iii

from collections import deque

class Solution:
    def canReach(self, arr: List[int], start: int) -> bool:
        if arr[start] == 0:
            return True
        n = len(arr)
        queue = deque()
        queue.append(start)
        visited = [False] * n
        visited[start] = True
        while queue:
            i = queue.popleft()
            candidates = [i + arr[i], i - arr[i]]
            for candidate in candidates:
                if candidate < 0 or candidate >= n:
                    continue
                if visited[candidate]:
                    continue
                if arr[candidate] == 0:
                    return True
                queue.append(candidate)
                visited[candidate] = True
        return False
