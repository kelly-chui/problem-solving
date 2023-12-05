from collections import deque

def bfs(roots):
    moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    bfsQ = deque(roots)
    while bfsQ:
        node = bfsQ.popleft()
        for i in range(4):
            y = node[0] + moves[i][0]
            x = node[1] + moves[i][1]
            if y < 0 or y >= n or x < 0 or x >= m:
                continue
            if isVisited[y][x]:
                continue
            if graph[y][x] == 0:
                isVisited[y][x] = True
                bfsQ.append((y, x))
                graph[y][x] = graph[node[0]][node[1]] + 1

m, n = map(int, input().split())
graph = []
for i in range(n):
    graph.append(list(map(int, input().split())))
isVisited = [[False] * m for _ in range(n)]
roots = []

for i in range(n):
    for j in range(m):
        if graph[i][j] == 1:
            isVisited[i][j] = True
            roots.append((i, j))

isContinue = False
for i in range(n):
    if 0 in graph[i]:
        isContinue = True
        break

if isContinue:
    bfs(roots)

    isEnd = False
    for i in range(n):
        if 0 in graph[i]:
            isEnd = True
            print(-1)
            break

    if not isEnd:
        maxValues = []
        for i in range(n):
            maxValues.append(max(graph[i]))
        print(max(maxValues) - 1)

else:
    print(0)