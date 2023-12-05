from collections import deque

def bfs(current):
    bfsQ = deque()
    bfsQ.append(current)
    isVisited[current] = True
    while bfsQ:
        location = bfsQ.popleft()
        for dice in range(1, 7):
            next_location = location + dice
            if next_location > 100:
                continue
            if next_location in ladders:
                next_location = ladders[next_location]
            elif next_location in snakes:
                next_location = snakes[next_location]
            if not isVisited[next_location]:
                bfsQ.append(next_location)
                isVisited[next_location] = True
                graph[next_location] = graph[location] + 1

n, m = map(int, input().split())
ladders = dict()
snakes = dict()
for _ in range(n):
    x, y = map(int, input().split())
    ladders[x] = y
for _ in range(m):
    u, v = map(int, input().split())
    snakes[u] = v

isVisited = [False for _ in range(101)]
graph = [0 for _ in range(101)]
bfs(1)
print(graph[100])
