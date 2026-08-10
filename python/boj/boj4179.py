from collections import deque

def bfs(jihun, fires):
    is_jihun_Visited = [[-1] * c for _ in range(r)]
    fire_queue = deque()
    jihun_queue = deque()
    fire_queue.append(fires)
    jihun_queue.append([jihun])
    
    is_jihun_Visited[jihun[0]][jihun[1]] = 0

    while jihun_queue or fire_queue:
        if jihun_queue:
            jihun_temp_queue = []
            jihun_nodes = jihun_queue.popleft()
            for cur in jihun_nodes:
                if graph[cur[0]][cur[1]] == "F":
                    continue
                for move in [(-1, 0), (0, 1), (1, 0), (0, -1)]:
                    next = (cur[0] + move[0], cur[1] + move[1])
                    if next[0] == -1 or next[1] == -1 or next[0] == r or next[1] == c:
                        return is_jihun_Visited[cur[0]][cur[1]] + 1
                    if next[0] < 0 or next[0] >= r or next[1] < 0 or next[1] >= c:
                        continue
                    if is_jihun_Visited[next[0]][next[1]] != -1:
                        continue
                    if graph[next[0]][next[1]] == ".":
                        jihun_temp_queue.append(next)
                        is_jihun_Visited[next[0]][next[1]] = is_jihun_Visited[cur[0]][cur[1]] + 1
            if jihun_temp_queue:
                jihun_queue.append(jihun_temp_queue)
                    
        if fire_queue:
            fire_temp_queue = []
            fire_nodes = fire_queue.popleft()
            for cur in fire_nodes:
                for move in [(-1, 0), (0, 1), (1, 0), (0, -1)]:
                    next = (cur[0] + move[0], cur[1] + move[1])
                    if next[0] < 0 or next[0] >= r or next[1] < 0 or next[1] >= c:
                        continue
                    if graph[next[0]][next[1]] == ".":
                        fire_temp_queue.append(next)
                        graph[next[0]][next[1]] = "F"
            if fire_temp_queue:
                fire_queue.append(fire_temp_queue)
    return "IMPOSSIBLE"

r, c = map(int, input().split())
graph = []
for _ in range(r):
    graph.append(list(input()))

jihun = (0, 0)
fires = []

for row in range(r):
    for column in range(c):
        if graph[row][column] == "J":
            jihun = (row, column)
        elif graph[row][column] == "F":
            fires.append((row, column))

print(bfs(jihun, fires))
