from collections import deque

def bfs(n, k):
    bfsQ = deque()
    bfsQ.append([n, 0])
    while bfsQ:
        node = bfsQ.popleft()
        if node[0] == k:
            return node[1]
        teleport = node[0] * 2
        front = node[0] + 1
        back = node[0] - 1
        moves = [teleport, front, back]
        for i in range(3):
            if moves[i] < 0 or moves[i] > 100_000:
                continue
            if not isVisited[moves[i]]:
                isVisited[moves[i]] = True
                bfsQ.append([moves[i], node[1] + 1])



n, k = map(int, input().split())
isVisited = [False] * 100_001
if n >= k:
    print(n - k)
else:
    print(bfs(n, k))