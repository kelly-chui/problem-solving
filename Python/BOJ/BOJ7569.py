import sys
from collections import deque

def bfs(root): # h, n, m
    bfsQ = deque(root)
    moves = [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]
    while bfsQ:
        node = bfsQ.popleft()
        for move in moves:
            x = node[2] + move[2]
            y = node[1] + move[1]
            z = node[0] + move[0]
            if x < 0 or x >= m or y < 0 or y >= n or z < 0 or z >= h:
                continue
            if isVisited[z][y][x]:
                continue
            if graph[z][y][x] == 0:
                isVisited[z][y][x] = True
                graph[z][y][x] = graph[node[0]][node[1]][node[2]] + 1
                bfsQ.append((z, y, x))

m, n, h = map(int, sys.stdin.readline().split())
graph = []
ripes = []
isVisited = [[[False] * m for i in range(n)] for j in range(h)]
isFinished = True

for height in range(h):
    box = []
    for row in range(n):
        box.append(list(map(int, sys.stdin.readline().split())))
    graph.append(box)

for height in range(h):
    for row in range(n):
        for column in range(m):
            if graph[height][row][column] == 1:
                ripes.append((height, row, column))

for height in range(h):
    for row in range(n):
        if 0 in graph[height][row]:
            isFinished = False

if not isFinished:
    bfs(ripes)
    isImpossible = False
    
    for height in range(h):
        for row in range(n):
            if 0 in graph[height][row]:
                isImpossible = True
                print(-1)
                break
        else:
            continue
        break
    
    if not isImpossible:
        maxGlobal = 1
        for height in range(h):
            for row in range(n):
                maxLocal = max(graph[height][row])
                maxGlobal = max(maxGlobal, maxLocal)
        print(maxGlobal - 1)
else:
    print(0)
    