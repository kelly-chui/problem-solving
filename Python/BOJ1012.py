import sys
from collections import deque

def bfs(v):
    bfsQ = deque()
    bfsQ.append(v)
    moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    while bfsQ:
        node = bfsQ.pop()
        for move in moves:
            x = move[0] + node[0]
            y = move[1] + node[1]
            if x < 0 or x >= m or y < 0 or y >= n:
                continue
            if isVisited[x][y] or graph[x][y] == 0:
                continue
            isVisited[x][y] = True
            bfsQ.append((x, y))

t = int(sys.stdin.readline())
for _ in range(t):
    m, n, k = map(int, sys.stdin.readline().split())
    graph = [[0] * n for _ in range(m)]
    isVisited = [[False] * n for _ in range(m)]
    count = 0

    for _ in range(k):
        row, column = map(int, sys.stdin.readline().split())
        graph[row][column] = 1
    
    for row in range(m):
        for column in range(n):
            if not isVisited[row][column] and graph[row][column] == 1:
                bfs((row, column))
                count += 1
    print(count)