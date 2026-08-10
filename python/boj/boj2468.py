from collections import deque

def bfs(v):
    bfsQ = deque()
    bfsQ.append(v)
    isVisited[v[0]][v[1]] = True
    moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    while bfsQ:
        node = bfsQ.popleft()
        for move in moves:
            row = node[0] + move[0]
            column = node[1] + move[1]
            if row < 0 or row >= n or column < 0 or column >= n:
                continue
            if isVisited[row][column] or isSunk[row][column]:
                continue
            bfsQ.append((row, column))
            isVisited[row][column] = True

n = int(input())
graph = []
max = 1
min = 100
isSunk = [[False] * n for _ in range(n)]
for i in range(n):
    graph.append(list(map(int, input().split())))

for i in graph:
    for j in i:
        if j > max:
            max = j
        if j < min:
            min = j

maxCount = 0
for waterHeight in range(min, max + 1):
    bfsCount = 0
    isVisited = [[False] * n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if graph[i][j] <= waterHeight:
                isSunk[i][j] = True
    for i in range(n):
        for j in range(n):
            if not isVisited[i][j] and not isSunk[i][j]:
                bfs((i, j))
                bfsCount += 1
    if maxCount < bfsCount:
        maxCount = bfsCount

print(maxCount)
