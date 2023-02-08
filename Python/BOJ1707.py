import sys
from collections import deque

def bfs(start_node):
    global isBipartite
    bfsQ = deque([start_node])
    isVisited[start_node[0]] = True
    graph_code[start_node[0]] = start_node[1]
    
    while bfsQ:
        current_node = bfsQ.popleft()
        for node in graph[current_node[0]]:
            if isVisited[node]: 
                if graph_code[node] == current_node[1]:
                    isBipartite = False
                    break
                else:
                    continue
            bfsQ.append((node, 0 if current_node[1] == 1 else 1))
            isVisited[node] = True
            graph_code[node] = 0 if current_node[1] == 1 else 1

K = int(sys.stdin.readline())

for _ in range(K):
    V, E = map(int, sys.stdin.readline().split())
    isBipartite = True
    graph = [[] for _ in range(V + 1)]
    graph_code = [0 for _ in range(V + 1)]
    isVisited = [False] * (V + 1)
    
    for _ in range(E):
        u, v = map(int, sys.stdin.readline().split())
        graph[u].append(v)
        graph[v].append(u)
    
    for idx in range(1, V):
        if not isVisited[idx]:
            bfs((idx, 0))

    print("YES" if isBipartite else "NO")
