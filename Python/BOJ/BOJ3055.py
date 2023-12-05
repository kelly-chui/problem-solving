from collections import deque

def beaverBFS(beaver, waterRoot):
    beaverQ = deque()
    waterQ = deque()
    beaverQ.append([beaver])
    waterQ.append(waterRoot)
    isVisitedBeaver[beaver[0]][beaver[1]] = True
    for water in waterRoot:
        isVisitedWater[water[0]][water[1]] = True
    moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while(len(beaverQ) != 0 or len(waterQ) != 0):
        if waterQ:
            waterNodes = waterQ.popleft()
            tempQ = []
            for waterNode in waterNodes:
                for move in moves:
                    row = waterNode[0] + move[0]
                    column = waterNode[1] + move[1]
                    if row < 0 or row >= r or column < 0 or column >= c:
                        continue
                    if graph[row][column] == "X" or graph[row][column] == "D" or isVisitedWater[row][column]:
                        continue
                    isVisitedWater[row][column] = True
                    tempQ.append((row, column))
            if len(tempQ) != 0:
                waterQ.append(tempQ)

        if beaverQ:
            beaverNodes = beaverQ.popleft()
            tempQ = []
            for beaverNode in beaverNodes:
                for move in moves:
                    row = beaverNode[0] + move[0]
                    column = beaverNode[1] + move[1]
                    if row < 0 or row >= r or column < 0 or column >= c:
                        continue
                    if isVisitedBeaver[row][column] or isVisitedWater[row][column] or graph[row][column] == "X":
                        continue
                    if graph[row][column] == "D":
                        return int(graph[beaverNode[0]][beaverNode[1]]) + 1
                    if graph[row][column] == ".":
                        graph[row][column]= str(int(graph[beaverNode[0]][beaverNode[1]]) + 1)
                        isVisitedBeaver[row][column] = True
                        tempQ.append((row, column))
            if len(tempQ) != 0:
                beaverQ.append(tempQ)
    return "KAKTUS"

graph = []
hedgehog = [0, 0]
waterRoot = []

r, c = map(int, input().split())
for _ in range(r):
    graph.append(list(input()))

isVisitedBeaver = [[False] * c for _ in range(r)]
isVisitedWater = [[False] * c for _ in range(r)]
for i in range(r):
    for j in range(c):
        if graph[i][j] == "*":
            waterRoot.append([i, j])
        elif graph[i][j] == "S":
            hedgehog = [i, j]
            graph[i][j] = "0"
print(beaverBFS(hedgehog, waterRoot))