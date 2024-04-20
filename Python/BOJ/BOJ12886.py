from collections import deque

def bfs(start):
    moves = [(0, 1), (1, 2), (0, 2)]
    is_visited = set([])
    queue = deque()
    queue.append(start)
    is_visited.add(tuple(start))

    while queue:
        current = queue.popleft()
        for move in moves:
            if current[move[0]] == current[move[1]]:
                continue
            temp = current
            if current[move[0]] < current[move[1]]:
                small = move[0]
                big = move[1]
            else:
                small = move[1]
                big = move[0]
            temp[small] = current[small] + current[small]
            temp[big] = current[big] - current[small]
            if tuple(temp) in is_visited:
                continue
            if temp[0] == temp[1] and temp[0] == temp[2] and temp[1] == temp[2]:
                print(1)
                exit()
            queue.append(temp)
            is_visited.add(tuple(temp))

a, b, c = map(int, input().split())

if (a + b + c) % 3 != 0:
    print(0)
    exit()

bfs([a, b, c])
print(0)