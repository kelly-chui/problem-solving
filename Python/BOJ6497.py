import sys

def find(a):
    if parent[a] != a:
        parent[a] = find(parent[a])
    return parent[a]

def union(a, b):
    pa, pb = find(a), find(b)
    parent[max(pa, pb)] = min(pa, pb)

while True:
    n, m = map(int, sys.stdin.readline().split())
    if n == 0 and m == 0:
        break
    
    edges, parent = [], list(range(n))
    for _ in range(m):
        u, v, w = map(int, sys.stdin.readline().split())
        edges.append((u, v, w))
    edges.sort(key=lambda x: x[2])

    answer = 0
    for u, v, w in edges:
        if find(u) != find(v):
            union(u, v)
        else:
            answer += w

    print(answer)