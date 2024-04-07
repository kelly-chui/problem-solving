import sys

n = int(sys.stdin.readline().rstrip())
m = int(sys.stdin.readline().rstrip())
inf = 987_654_321
graph = [[inf] * (n + 1) for _ in range(n + 1)]
for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    graph[a][b] = 1

for mid in range(1, n + 1):
    for start in range(1, n + 1):
        for end in range(1, n + 1):
            if graph[start][end] > graph[start][mid] + graph[mid][end]:
                graph[start][end] = graph[start][mid] + graph[mid][end]

for i in range(1, n + 1):
    count = 0
    for j in range(1, n + 1):
        if graph[i][j] == inf and graph[j][i] == inf:
            count += 1
    print(count - 1)