from collections import deque

def bfs(location):
    visit = [[0] * m for _ in range(n)]
    bfsQ = deque()
    bfsQ.append(location)
    visit[0][0] = 1
    while bfsQ:
        node = bfsQ.popleft()
        up = [node[0] - 1, node[1]]
        down = [node[0] + 1, node[1]]
        left = [node[0], node[1] - 1]
        right = [node[0], node[1] + 1]
        moves = [up, down, left, right]
        for i in range(len(moves)):
            x = moves[i][0]
            y = moves[i][1]
            if x < 0 or y < 0 or x >= n or y >= m:
                continue
            if maze[x][y] == "0":
                continue
            if visit[x][y] == 0:
                visit[x][y] = visit[node[0]][node[1]] + 1
                bfsQ.append([x, y])
    return visit[n - 1][m - 1]

maze = []
n, m = map(int, input().split())
for i in range(n):
    temp = list(input())
    maze.append(temp)
print(bfs([0, 0]))
