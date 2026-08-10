# https://leetcode.com/problems/check-if-there-is-a-valid-path-in-a-grid

from collections import deque
class Solution:
    def hasValidPath(self, grid: List[List[int]]) -> bool:
        m, n = len(grid), len(grid[0])
        
        def boundaryCheck(row: int, col: int) -> bool:
            return 0 <= row < m and 0 <= col < n
        
        graph = {}
        for row in range(m):
            for col in range(n):
                graph[(row, col)] = []
                if grid[row][col] == 1:
                    candidates = [(row, col - 1), (row, col + 1)]
                elif grid[row][col] == 2:
                    candidates = [(row - 1, col), (row + 1, col)]
                elif grid[row][col] == 3:
                    candidates = [(row, col - 1), (row + 1, col)]
                elif grid[row][col] == 4:
                    candidates = [(row, col + 1), (row + 1, col)]
                elif grid[row][col] == 5:
                    candidates = [(row, col - 1), (row - 1, col)]
                else:
                    candidates = [(row, col + 1), (row - 1, col)]
                for nr, nc in candidates:
                    if boundaryCheck(nr, nc):
                        graph[(row, col)].append((nr, nc))
        queue = deque([(0, 0)])
        visited = [[False] * n for _ in range(m)]
        visited[0][0] = True
        while queue:
            row, col = queue.popleft()
            if row == m - 1 and col == n - 1:
                return True
            for nr, nc in graph[(row, col)]:
                if visited[nr][nc]:
                    continue
                if (row, col) not in graph[(nr, nc)]:
                    continue
                visited[nr][nc] = True
                queue.append((nr, nc))
        return False
