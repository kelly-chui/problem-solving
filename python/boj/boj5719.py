import heapq
import sys

INF = 2 ** 62

def findShortestPath(n, start, end):
    heap = []
    distances = [INF] * n
    parents = [[] for _ in range(n)]
    heapq.heappush(heap, (0, start))
    distances[start] = 0
    while heap:
        dist, node = heapq.heappop(heap)
        if dist != distances[node]:
            continue
        for nextDist, nextNode in graph.get(node, []):
            if (node, nextNode) in checkedEdges:
                continue
            if distances[nextNode] > nextDist + dist:
                distances[nextNode] = nextDist + dist
                parents[nextNode] = [node]
                heapq.heappush(heap, (nextDist + dist, nextNode))
            elif distances[nextNode] == nextDist + dist:
                parents[nextNode].append(node)
    return distances[end], parents
def checkShortestPathEdges(parents, start, end):
    stack = [end]
    visited = [False] * len(parents)
    while stack:
        node = stack.pop()
        if visited[node]:
            continue
        visited[node] = True
        for p in parents[node]:
            checkedEdges.add((p, node))
            if p != start:
                stack.append(p)
graph = {}
answer = []
while True:
    n, m = map(int, sys.stdin.readline().split())
    if n == 0 and m == 0:
        break
    s, d = map(int, sys.stdin.readline().split())
    graph = {}
    checkedEdges = set()
    for _ in range(0, m):
        u, v, p = map(int, sys.stdin.readline().split())
        graph.setdefault(u, []).append((p, v))
    shortestDistance, parents = findShortestPath(n, s, d)
    if shortestDistance == INF:
        answer.append(-1)
        continue
    checkShortestPathEdges(parents, s, d)
    almostShortestDistance, _ = findShortestPath(n, s, d)
    answer.append(-1 if almostShortestDistance == INF else almostShortestDistance)
sys.stdout.write("\n".join(map(str, answer)))
