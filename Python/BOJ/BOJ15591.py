from collections import deque

def bfs(k, v):
    queue = deque()
    queue.append((v, 987_654_321))
    isVisited = [False] * (n + 1)
    isVisited[v] = True
    answer = 0

    while queue:
        cur_node, cur_usado = queue.popleft()
        for next_node, next_usado in graph[cur_node]:
            if isVisited[next_node]:
                continue
            if cur_usado < next_usado:
                next_usado = cur_usado
            if next_usado >= k:
                queue.append((next_node, next_usado))
                isVisited[next_node] = True
                answer += 1
    print(answer)



n, q = map(int, input().split())
graph = {}
for _ in range(n - 1):
    pi, qi, ri = map(int, input().split())
    if pi in graph:
        graph[pi].append((qi, ri))
    else:
        graph[pi] = [(qi, ri)]
    if qi in graph:
        graph[qi].append((pi, ri))
    else:
        graph[qi] = [(pi, ri)]

for _ in range(q):
    k, v = map(int, input().split())
    bfs(k, v)