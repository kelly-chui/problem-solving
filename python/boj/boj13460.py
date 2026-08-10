import sys
from collections import deque

def move(red, blue, d):
    dr, dc = d
    rr, rc = red
    redCount = 0
    isRedHole = False
    while graph[rr + dr][rc + dc] != "#" and graph[rr][rc] != "O":
        rr += dr
        rc += dc
        redCount += 1
        if graph[rr][rc] == "O":
            isRedHole = True
            break
    
    br, bc = blue
    blueCount = 0
    isBlueHole = False
    while graph[br + dr][bc + dc] != "#" and graph[br][bc] != "O":
        br += dr
        bc += dc
        blueCount += 1
        if graph[br][bc] == "O":
            isBlueHole = True
            break
    if not isRedHole and not isBlueHole and (rr, rc) == (br, bc):
        if redCount > blueCount:
            rr -= dr
            rc -= dc
        elif redCount < blueCount:
            br -= dr
            bc -= dc
        else:
            pass # 불가능
    nRed = (rr, rc)
    nBlue = (br, bc)
    return nRed, nBlue, isRedHole, isBlueHole

def bfs(red, blue):
    directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    queue = deque()
    visited = set()
    queue.append((red, blue, 0))
    visited.add((red, blue))
    while queue:
        curRed, curBlue, count = queue.popleft()
        if count >= 10:
            continue
        for d in directions:
            nRed, nBlue, isRedHole, isBlueHole = move(curRed, curBlue, d)
            if isBlueHole:
                continue
            if isRedHole:
                return count + 1
            if (nRed, nBlue) not in visited:
                visited.add((nRed, nBlue))
                queue.append((nRed, nBlue, count + 1))
    return -1
        
n, m = map(int, sys.stdin.readline().strip().split())
graph = []
redLocation = None
blueLocation = None
holeLocation = None
for _ in range(n):
    graph.append(list(sys.stdin.readline().strip()))

for r in range(n):
    for c in range(m):
        if graph[r][c] == "R":
            redLocation = (r, c)
            graph[r][c] = "."
        elif graph[r][c] == "B":
            blueLocation = (r, c)
            graph[r][c] = "."
        elif graph[r][c] == "O":
            holeLocation = (r, c)

print(bfs(redLocation, blueLocation))
