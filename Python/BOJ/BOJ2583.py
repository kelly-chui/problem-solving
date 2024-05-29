from collections import deque

def bfs(root):
    moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    queue = deque()
    queue.append(root)
    is_visited[root[0]][root[1]] = True
    answer = 1
    while queue:
        current = queue.popleft()
        for move in moves:
            next = (current[0] + move[0], current[1] + move[1])
            if next[0] < 0 or next[0] >= m or next[1] < 0 or next[1] >= n:
                continue
            if is_visited[next[0]][next[1]]:
                continue
            if graph[next[0]][next[1]] == 1:
                continue
            queue.append(next)
            is_visited[next[0]][next[1]] = True
            answer += 1
    return answer
        

m, n, k = map(int, input().split())
graph = [[0] * n for _ in range(m)]
for _ in range(k):
    x1, y1, x2, y2 = map(int, input().split())
    for row in range(y1, y2):
        for column in range(x1, x2):
            graph[row][column] = 1

area_list = []
is_visited = [[False] * n for _ in range(m)]

for row in range(0, m):
    for column in range(0, n):
        if not is_visited[row][column] and graph[row][column] == 0:
            area_list.append(bfs((row, column, 0)))
            is_visited[row][column]

area_list.sort()
print(len(area_list))
for idx in range(len(area_list)):
    print(area_list[idx], end = " " if idx != len(area_list) - 1 else "\n")