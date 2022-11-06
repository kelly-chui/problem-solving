from collections import deque

def bfs(v):
    bfsQ = deque()
    bfsQ.append(v)
    isVisited[v[0]][v[1]] = True
    moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    count = 1
    while bfsQ:
        node = bfsQ.popleft()
        for move in moves:
            row = node[0] + move[0]
            column = node[1] + move[1]
            if row < 0 or row >= n or column < 0 or column >= n:
                continue
            if graph[row][column] != 0 and not isVisited[row][column]:
                isVisited[row][column] = True
                bfsQ.append((row, column))
                count += 1
    return count

n = int(input())
graph = []
for _ in range(n):
    temp = input()
    graph.append(list(map(int, temp)))

isVisited = [[False] * n for i in range(n)]
area = []
for row in range(n):
    for column in range(n):
        if graph[row][column] == 1 and not isVisited[row][column]:
            area.append(bfs((row, column)))
area.sort()
print(len(area))
for i in range(len(area)):
    print(area[i])