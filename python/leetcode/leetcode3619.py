# https://leetcode.com/problems/count-islands-with-total-value-divisible-by-k

from collections import deque

class Solution:
    def countIslands(self, grid: List[List[int]], k: int) -> int:
        m = len(grid)
        n = len(grid[0])

        def bfs(start: (int, int)) -> int:
            nonlocal isVisited
            queue = deque()
            queue.append(start)
            isVisited[start[0]][start[1]] = True
            sumOfCells = grid[start[0]][start[1]]
            while queue:
                row, col = queue.popleft()
                for dr, dc in [(-1, 0), (0, 1), (1, 0), (0, -1)]:
                    newRow = row + dr
                    newCol = col + dc
                    if newRow < 0 or newRow >= m or newCol < 0 or newCol >= n:
                        continue
                    if isVisited[newRow][newCol]:
                        continue
                    if grid[newRow][newCol] == 0:
                        continue
                    sumOfCells += grid[newRow][newCol]
                    queue.append((newRow, newCol))
                    isVisited[newRow][newCol] = True

            return sumOfCells

        isVisited = [[False] * n for _ in range(m)]
        answer = 0
        for row in range(m):
            for col in range(n):
                if not isVisited[row][col] and grid[row][col] != 0:
                    if bfs(start = (row, col)) % k == 0:
                        answer += 1

        return answer
