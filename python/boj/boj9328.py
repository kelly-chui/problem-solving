from collections import deque

def bfs(building, keys, h, w):
    answer = 0
    doorTable = {}
    queue = deque()
    isVisited = [[False] * (w + 2) for _ in range(h + 2)]
    queue.append((0, 0))
    isVisited[0][0] = True
    moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    while queue:
        row, col = queue.popleft()
        for move in moves:
            newRow, newCol = row + move[0], col + move[1]
            if newRow < 0 or newRow >= h + 2 or newCol < 0 or newCol >= w + 2:
                continue
            if isVisited[newRow][newCol]:
                continue
            cell = building[newRow][newCol]
            if cell == "*":
                continue
            if cell.isalpha():
                if cell.isupper():
                    if not cell.lower() in keys:
                        doorTable.setdefault(cell, []).append((newRow, newCol))
                        continue
                elif cell.islower():
                    if not cell in keys:
                        for r, c in doorTable.get(cell.upper(), []):
                            isVisited[r][c] = True
                            queue.append((r, c))
                        keys.add(cell)
            if cell == "$":
                answer += 1
            isVisited[newRow][newCol] = True
            queue.append((newRow, newCol))
    return answer

testCaseCount = int(input())
answer = []
for _ in range(testCaseCount):
    h, w = map(int, input().split())
    building = [["."] * (w + 2)]
    for _ in range(h):
        building.append(["."] + list(input()) + ["."])
    building.append(["."] * (w + 2))
    keyInput = input()
    keys = set() if keyInput == "0" else set(list(keyInput))
    answer.append(bfs(building, keys, h, w))
for a in answer:
    print(a)
