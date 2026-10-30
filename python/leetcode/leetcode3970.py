# https://leetcode.com/problems/shortest-path-with-at-most-k-consecutive-identical-characters

import heapq

class Solution:
    def shortestPath(self, n: int, edges: List[List[int]], labels: str, k: int) -> int:
        class HeapNode:
            def __init__(self, distance: int, node: int, count: int):
                self.distance = distance
                self.node = node
                self.count = count
            def __lt__(self, other: "HeapNode") -> bool:
                return self.distance < other.distance
        
        def dijkstra(start: int) -> int:
            heap = []
            heapq.heappush(heap, HeapNode(0, start, 1))
            distances = [[float("INF")] * (k + 1) for _ in range(n)]
            distances[start][1] = 0

            while heap:
                current = heapq.heappop(heap)
                if current.distance > distances[current.node][current.count]:
                    continue
                if current.node == n - 1:
                    return current.distance
                for nextDistance, nextNode in graph[current.node]:
                    consecutiveCount = current.count
                    if labels[current.node] == labels[nextNode]:
                        consecutiveCount += 1
                    else:
                        consecutiveCount = 1
                    if consecutiveCount > k:
                        continue
                    if current.distance + nextDistance < distances[nextNode][consecutiveCount]:
                        distances[nextNode][consecutiveCount] = current.distance + nextDistance
                        heapq.heappush(
                            heap,
                            HeapNode(
                                distances[nextNode][consecutiveCount],
                                nextNode,
                                consecutiveCount
                            )
                        )

            return min(distances[n - 1])

        graph = [[] for _ in range(n)]
        for u, v, w in edges:
            graph[u].append((w, v))
        minDistance = dijkstra(start = 0)
        
        return minDistance if minDistance != float("INF") else -1
