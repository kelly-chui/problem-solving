# https://leetcode.com/problems/find-a-safe-walk-through-a-grid

import heapq

class Solution:
    def findSafeWalk(self, grid: List[List[int]], health: int) -> bool:
        m, n = len(grid), len(grid[0])
        def dijkstra(start: Tuple[int, int]) -> int:
            heap = []
            distance = [[float('inf')] * n for _ in range(m)]
            heapq.heappush(heap, (grid[start[0]][start[1]], start))
            distance[start[0]][start[1]] = grid[start[0]][start[1]]
            
            moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
            while heap:
                dist, (row, col) = heapq.heappop(heap)
                if dist > distance[row][col]:
                    continue
                for dr, dc in moves:
                    newRow, newCol = row + dr, col + dc
                    if newRow < 0 or newRow >= m or newCol < 0 or newCol >= n:
                        continue
                    if dist + grid[newRow][newCol] < distance[newRow][newCol]:
                        distance[newRow][newCol] = dist + grid[newRow][newCol]
                        heapq.heappush(heap, (dist + grid[newRow][newCol], (newRow, newCol)))
            return distance[m - 1][n - 1]
        return dijkstra(start = (0, 0)) < health
