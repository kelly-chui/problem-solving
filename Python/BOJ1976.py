def find(a):
    if parents[a] != a:
        parents[a] = find(parents[a])
    return parents[a]

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

n = int(input())
m = int(input())
graph = []
for _ in range(n):
    graph.append(list(map(int, (input().split()))))
plan = list(map(lambda x: int(x) - 1, input().split()))

parents = [i for i in range(n + 1)]
ranks = [0] * n
isPlan = True

for row in range(n):
    for column in range(row + 1):
        if graph[row][column] == 1:
            union(row, column)

for city in plan:
    if find(plan[0]) != find(city):
        isPlan = False
        break
print("YES" if isPlan else "NO")