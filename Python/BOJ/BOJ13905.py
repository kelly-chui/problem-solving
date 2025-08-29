import sys

def find(a):
    while a != parents[a]:
        parents[a] = parents[parents[a]]
        a = parents[a]
    return a
def union(a, b):
    pa = find(a)
    pb = find(b)
    if pa == pb:
        return
    if size[pa] >= size[pb]:
        parents[pb] = pa
        size[pa] += size[pb]
    else:
        parents[pa] = pb
        size[pb] += size[pa]
n, m = map(int, sys.stdin.readline().split())
s, e = map(int, sys.stdin.readline().split())
edges = []
parents = [i for i in range(n + 1)]
size = [1] * (n + 1)
for _ in range(m):
    h1, h2, k = map(int, sys.stdin.readline().split())
    edges.append((h1, h2, k))
edges.sort(key = lambda x: x[2], reverse = True)
answer = 0
for edge in edges:
    h1, h2, k = edge
    if find(h1) != find(h2):
        union(h1, h2)
        if find(s) == find(e):
            answer = k
            break
print(answer)