n, m, k = map(int, input().split())
board = []
table = [[0] * m for _ in range(n)]
for _ in range(n):
    board.append(input())
color = ""
temp = 0
temp1 = 0
ans = k * k
for i in range(n):
    color = ("B" if i % 2 == 0  else "W")
    for j in range(m):
        if j == 0:
            if board[i][j] != color:
                table[i][j] = 1
                color = ("W" if color == "B" else "B")
                continue
        if board[i][j] != color:
            table[i][j] = table[i][j - 1] + 1
        else:
            table[i][j] += table[i][j - 1]
        color = ("W" if color == "B" else "B")

for i in range(n):
    for j in range(m):
        if i == 0:
            continue
        table[i][j] += table[i - 1][j]

for i in range(n - k + 1):
    for j in range(m - k + 1):
        if i == 0 and j == 0:
            temp1 = table[i + k - 1][j + k - 1]
            temp = min(temp1, k * k - temp1)
        elif i == 0 and j != 0:
            temp1 = table[i + k - 1][j + k - 1] - table[i + k - 1][j - 1]
            temp = min(temp1, k * k - temp1)
        elif i != 0 and j == 0:
            temp1 = table[i + k - 1][j + k - 1] - table[i - 1][j + k - 1]
            temp = min(temp1, k * k - temp1)
        else:
            temp1 = table[i + k - 1][j + k - 1] - table[i - 1][j + k - 1] - table[i + k - 1][j - 1] + table[i - 1][j - 1]
            temp = min(temp1, k * k - temp1)
        
        if temp < ans:
            ans = temp

print(ans)
