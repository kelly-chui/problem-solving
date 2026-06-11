# https://leetcode.com/problems/number-of-ways-to-assign-edge-weights-i

from collections import deque

class Solution:
    def bfs(self, start: int, n: int, graph: Dict[int, List[int]]) -> int:
        visited = [-1] * (n + 1)
        queue = deque()
        queue.append(start)
        visited[start] = 0

        while queue:
            current = queue.popleft()
            for nextNode in graph.get(current, []):
                if visited[nextNode] != -1:
                    continue
                visited[nextNode] = visited[current] + 1
                queue.append(nextNode)
        return max(visited)

    def assignEdgeWeights(self, edges: List[List[int]]) -> int:
        graph = {}
        for u, v in edges:
            graph.setdefault(u, []).append(v)
            graph.setdefault(v, []).append(u)
        maxDepth = self.bfs(start = 1, n = len(edges) + 1, graph = graph)
        return pow(2, maxDepth - 1, 1000000007)
