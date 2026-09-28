# https://school.programmers.co.kr/learn/courses/30/lessons/1844?language=python3

from collections import deque

def solution(maps):
    n = len(maps)
    m = len(maps[0])
    def bfs() -> int:
        queue = deque()
        queue.append((0, 0))
        isVisited = [[-1] * m for _ in range(n)]
        isVisited[0][0] = 1
        while queue:
            row, col = queue.popleft()
            for dr, dc in [(-1, 0), (0, 1), (1, 0), (0, -1)]:
                newRow = row + dr
                newCol = col + dc
                if 0 > newRow or n <= newRow or 0 > newCol or m <= newCol:
                    continue
                if isVisited[newRow][newCol] != -1:
                    continue
                if maps[newRow][newCol] == 0:
                    continue
                if newRow == n - 1 and newCol == m - 1:
                    return isVisited[row][col] + 1
                queue.append((newRow, newCol))
                isVisited[newRow][newCol] = isVisited[row][col] + 1
        return -1
    answer = bfs()
    return answer
