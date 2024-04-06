import heapq
import sys

def dijkstra(start):
    moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    heap = [(0, start)]
    distance = [[sys.maxsize] * m for _ in range(n)]
    distance[start[0]][start[1]] = 0
    
    while heap:
        current_time, current_location = heapq.heappop(heap)
        current_height = graph[current_location[0]][current_location[1]]
        if distance[current_location[0]][current_location[1]] < current_time:
            continue
        for move in moves:
            next_location = (current_location[0] - move[0], current_location[1] - move[1])
            if next_location[0] < 0 or next_location[0] >= n or next_location[1] < 0 or next_location[1] >= m:
                continue
            next_height = graph[next_location[0]][next_location[1]]
            if abs(current_height - next_height) > t:
                continue
            next_time = 1 if current_height >= next_height else (current_height - next_height) ** 2
            if distance[next_location[0]][next_location[1]] > current_time + next_time:
                distance[next_location[0]][next_location[1]] = current_time + next_time
                heapq.heappush(heap, (current_time + next_time, next_location))
    return distance

n, m, t, d = map(int, sys.stdin.readline().rstrip().split())

graph = []

dict = {}
for i, char in enumerate(range(97, 123)):
    dict[chr(char)] = i + 26
for i, char in enumerate(range(65, 91)):
    dict[chr(char)] = i

for _ in range(n):
    graph.append(list(map(lambda char: dict[char], sys.stdin.readline().rstrip())))

start_distance = dijkstra((0, 0))
answer = 0

for row in range(n):
    for column in range(m):
        total = start_distance[row][column] + dijkstra((row, column))[0][0]
        if total <= d and graph[row][column] > answer:
            answer = graph[row][column]
print(answer)