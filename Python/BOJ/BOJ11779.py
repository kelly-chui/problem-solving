import sys, heapq

def dijkstra(start):
    routes = [start] * (n + 1)
    distance = [1e9] * (n + 1)
    q = [(0, start)]
    while q:
        dist, now = heapq.heappop(q)
        if dist > distance[now]:
            continue
        
        for next, nextDist in graph[now]:
            cost = nextDist + dist
            if cost < distance[next]:
                distance[next], routes[next] = cost, now
                heapq.heappush(q, (cost, next))
    ans = []
    tmp = end
    while tmp != start:
        ans.append(str(tmp))
        tmp = routes[tmp]
    ans.append(str(start))
    ans.reverse()
    print(distance[end])
    print(len(ans))
    print(" ".join(ans))

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())
graph = [[] for _ in range(n + 1)]

for _ in range(m):
    s, e, c = map(int, input().split())
    graph[s].append((e, c))

start, end = map(int, input().split())

dijkstra(start)