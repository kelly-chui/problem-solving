import heapq

def dijkstra(start, m, n):
    moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    heap = []
    heapq.heappush(heap, (0, start))
    distances = [[100_000_000] * (m + 1) for _ in range(n + 1)]
    distances[start[0]][start[1]] = 0
    
    while heap:
        (dist, node) = heapq.heappop(heap)
        if distances[node[0]][node[1]] < dist:
            continue
        for move in moves:
            newNode = (node[0] + move[0], node[1] + move[1])
            if newNode[0] < 1 or newNode[0] > n or newNode[1] < 1 or newNode[1] > m:
                continue
            if graph[newNode[0] - 1][newNode[1] - 1] == 1:
                if distances[newNode[0]][newNode[1]] > distances[node[0]][node[1]] + 1:
                    distances[newNode[0]][newNode[1]] = distances[node[0]][node[1]] + 1
                    heapq.heappush(heap, (distances[node[0]][node[1]] + 1, newNode))
            else:
                if distances[newNode[0]][newNode[1]] > distances[node[0]][node[1]]:
                    distances[newNode[0]][newNode[1]] = distances[node[0]][node[1]]
                    heapq.heappush(heap, (distances[node[0]][node[1]], newNode))
    return distances[n][m]
    

m, n = map(int, input().split())
graph = []
for _ in range(n):
    graph.append(list(map(int, input())))
print(dijkstra((1, 1), m, n))