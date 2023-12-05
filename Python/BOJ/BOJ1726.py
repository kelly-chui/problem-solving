# east 0 west 1 south 2 north 3
from collections import deque

def bfs(start):
    bfsQ = deque()
    bfsQ.append(start)
    isVisited[start[0]][start[1]][start[2]] = True
    count[start[0]][start[1]][start[2]] = 0

    while(bfsQ):
        node = bfsQ.popleft()
        currentDir = node[2]
        currentCount = count[node[0]][node[1]][node[2]]
        if node == end:
            return currentCount

        for dir in rotate[currentDir]:
            if end == [node[0], node[1], dir]:
                return currentCount + 1
            if isVisited[node[0]][node[1]][dir]:
                continue
            isVisited[node[0]][node[1]][dir] = True
            count[node[0]][node[1]][dir] = currentCount + 1
            bfsQ.append((node[0], node[1], dir))

        if currentDir == 0:
            moves = [(0, 1), (0, 2), (0, 3)]
        elif currentDir == 1:
            moves = [(0, -1), (0, -2), (0, -3)]
        elif currentDir == 2:
            moves = [(1, 0), (2, 0), (3, 0)]
        else:
            moves = [(-1, 0), (-2, 0), (-3, 0)]

        for move in moves:
            row = node[0] + move[0]
            column = node[1] + move[1]
            if end == [row, column, currentDir]:
                return currentCount + 1
            if row < 0 or row >= m or column < 0 or column >= n:
                continue
            if isVisited[row][column][currentDir]:
                continue
            if graph[row][column] == 1:
                break
            isVisited[row][column][currentDir] = True
            count[row][column][currentDir] = currentCount + 1
            bfsQ.append((row, column, currentDir))

graph = []
rotate = {0: [2, 3],
          1: [2, 3],
          2: [0, 1],
          3: [0, 1]}
m, n = map(int, input().split())
for _ in range(m):
    graph.append(list(map(int, input().split())))
start = list(map(int, input().split()))
end = list(map(int, input().split()))

for i in range(3):
    start[i] -= 1
    end[i] -= 1

isVisited = [[[False] * 4 for i in range(n)] for j in range(m)]
count = [[[0] * 4 for i in range(n)] for j in range(m)]
print(bfs(start))
