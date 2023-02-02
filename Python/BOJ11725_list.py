import sys
from collections import deque

def bfs(root):
    bfsQ = deque()
    bfsQ.append(root)
    isVisited[root] = True
    while bfsQ:
        current_node = bfsQ.pop()
        for node in tree[current_node]:
            if isVisited[node]:
                continue
            isVisited[node] = True
            answer[node] = current_node
            bfsQ.append(node)
            

n = int(sys.stdin.readline())
isVisited = [False] * (n + 1)
answer = [0] * (n + 1)
tree = [[] for _ in range(n + 1)]
for _ in range(n - 1):
    node1, node2 = map(int, sys.stdin.readline().split())
    tree[node1].append(node2)
    tree[node2].append(node1)

bfs(1)

for i in range(2, n + 1):
    print(answer[i])
