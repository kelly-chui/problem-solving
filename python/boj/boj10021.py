def find(field):
    if parent[field] == field:
        return field
    else:
        parent[field] = find(parent[field])
        return parent[field]

def union(a, b):
    pa = find(a)
    pb = find(b)
    if pa != pb:
        parent[pa] = pb

def squared_euclidean_length(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2

n, c = map(int, input().split())
fields = []
mapping = {}

for idx in range(n):
    xi, yi = map(int, input().split())
    fields.append((xi, yi))
    mapping[(xi, yi)] = idx
edges = []
parent = list(range(n))

for i in range(0, len(fields) - 1):
    for j in range(i + 1, len(fields)):
        distance = squared_euclidean_length(fields[i], fields[j])
        if distance >= c:
            edges.append((mapping[fields[i]], mapping[fields[j]], distance))

edges.sort(key = lambda x: x[2])

answer = 0
count = 0
for edge in edges:
    if find(edge[0]) != find(edge[1]):
        union(edge[0], edge[1])
        answer += edge[2]
        count += 1

print(answer if count == n - 1 else -1)
