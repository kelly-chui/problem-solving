# https://leetcode.com/problems/minimum-score-of-a-path-between-two-cities

from collections import deque

class Solution:
    def minScore(self, n: int, roads: List[List[int]]) -> int:
        graph = defaultdict(list)
        for a, b, distance in roads:
            graph[a].append((distance, b))
            graph[b].append((distance, a))
        visited = set()
        answer = float("inf")
        stack = [1]
        while stack:
            node = stack.pop()
            if node in visited:
                continue
            visited.add(node)
            for distance, nextNode in graph[node]:
                ans = min(ans, distance)
                if nextNode not in visited:
                    stack.append(nextNode)

        return answer
