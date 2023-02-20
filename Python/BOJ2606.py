from collections import deque

def bfs(root):
    bfsQ = deque([root])
    isVisited[root] = 1
    while bfsQ:
        node = bfsQ.popleft()
        for computer in graph[node]:
            if isVisited[computer] == 1:
                continue
            else:
                bfsQ.append(computer)
                isVisited[computer] = 1

n = int(input())
m = int(input())
graph = [[] for _ in range(n + 1)]
isVisited = [0 for _ in range(n + 1)]
for _ in range(m):
    a, b = map(int, input().split())
    graph[a].append(b)
    graph[b].append(a)

bfs(1)
print(sum(isVisited) - 1)