from collections import deque

def bfs(start, end):
    moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    queue = deque()
    isVisited = [[False] * w for _ in range(h)]
    queue.append((start, 0))
    isVisited[start[0]][start[1]] = True
    
    while queue:
        cur_place, cur_time = queue.popleft()
        for move in moves:
            new_place = (cur_place[0] + move[0], cur_place[1] + move[1])
            if new_place[0] < 0 or new_place[0] >= h or new_place[1] < 0 or new_place[1] >= w:
                continue
            if isVisited[new_place[0]][new_place[1]]:
                continue
            if graph[new_place[0]][new_place[1]] == "X":
                continue
            if graph[new_place[0]][new_place[1]] == end:
                return cur_time + 1
            queue.append((new_place, cur_time + 1))
            isVisited[new_place[0]][new_place[1]] = True
    return 0

h, w, n = map(int, input().split())
graph = []
for _ in range(h):
    graph.append(list(input()))

cheese_mapping = {}
for row in range(h):
    for column in range(w):
        if graph[row][column] in ["1", "2", "3", "4", "5", "6", "7", "8", "9"]:
            cheese_mapping[graph[row][column]] = (row, column)
        if graph[row][column] == "S":
            cheese_mapping["0"] = (row, column)
answer = 0
for cheese in range(1, n + 1):
    answer += bfs(cheese_mapping[str(cheese - 1)], str(cheese))

print(answer)
