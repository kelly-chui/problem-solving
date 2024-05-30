from collections import deque

def bfs(root):
    queue = deque()
    queue.append(root)
    is_visited = [-1] * (n + 1)
    is_visited[root] = 0

    while queue:
        cur = queue.popleft()
        for p in table[cur]:
            if is_visited[p] != -1:
                continue
            queue.append(p)
            is_visited[p] = is_visited[cur] + 1
    return is_visited[p2]

n = int(input())
p1, p2 = map(int, input().split())
m = int(input())
table = [[] for _ in range(n + 1)]
for _ in range(m):
    x, y = map(int, input().split())
    table[x].append(y)
    table[y].append(x)

print(bfs(p1))