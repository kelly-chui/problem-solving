import sys

def union(a, b):
    pa = find(a)
    pb = find(b)
    if pa == pb:
        return
    if ranks[pa] > ranks[pb]:
        parents[pb] = pa
    elif ranks[pa] < ranks[pb]:
        parents[pa] = pb
    else:
        parents[pb] = pa
        ranks[pa] += 1

def find(x):
    if parents[x] != x:
        parents[x] = find(parents[x])
    return parents[x]

def isSameSet(a, b):
    if find(a) == find(b):
        print("yes")
    else:
        print("no")

n, m = map(int, sys.stdin.readline().split())
parents = [i for i in range(n + 1)]
ranks = [0 for _ in range(n + 1)]
for _ in range(m):
    operator, a, b = map(int, sys.stdin.readline().split())
    if operator == 0:
        union(a, b)
    else:
        isSameSet(a, b)

print(parents)