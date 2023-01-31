import sys

n, m = map(int, sys.stdin.readline().split())
table = []
points = []
for _ in range(n):
    table.append(list(map(int, sys.stdin.readline().split())))

for row in range(n):
    for column in range(n):
        if column == 0:
            continue
        table[row][column] += table[row][column - 1]
for column in range(n):
    for row in range(n):
        if row == 0:
            continue
        table[row][column] += table[row - 1][column]
for _ in range(m):
    x1, y1, x2, y2 = map(lambda x: x - 1, map(int, sys.stdin.readline().split()))
    if y1 == 0 and x1 == 0:
        ans = table[x2][y2]
    elif y1 == 0 and x1 != 0:
        ans = table[x2][y2] - table[x1 - 1][y2]
    elif x1 == 0 and y1 != 0:
        ans = table[x2][y2] - table[x2][y1 - 1]
    else:
        ans = table[x2][y2] - table[x2][y1 - 1] - table[x1 - 1][y2] + table[x1 - 1][y1 - 1]
    print(ans)
    