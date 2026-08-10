import sys
from collections import deque

def bfs(root):
    isTree = 1
    queue = deque([(0, root)])
    isVisited[root] = True
    while queue:
        node = queue.popleft()
        for neighbor in graph[node[1]]:
            if isVisited[neighbor] and neighbor != node[0]:
                isTree = 0
            if isVisited[neighbor]:
                continue
            queue.append((node[1], neighbor))
            isVisited[neighbor] = True
    return isTree

isVisited = []
graph = {}
case_count = 1
while True:
    answer = 0
    n, m = map(int, sys.stdin.readline().split())
    if (n, m) == (0, 0):
        break
    graph = {}
    isVisited = [False] * (n + 1)
    for _ in range(m):
        a, b = map(int, sys.stdin.readline().split())
        if a in graph:
            graph[a].append(b)
        else:
            graph[a] = [b]
        
        if b in graph:
            graph[b].append(a)
        else:
            graph[b] = [a]
    for node in range(1, n + 1):
        if node not in graph:
            answer += 1
            continue
        if isVisited[node]:
            continue
        answer += bfs(node)
    
    if answer == 0:
        print(f"Case {case_count}: No trees.")
    elif answer == 1:
        print(f"Case {case_count}: There is one tree.")
    else:
        print(f"Case {case_count}: A forest of {answer} trees.")
    case_count += 1
