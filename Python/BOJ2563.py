n = int(input())
count = 0
board = [[0] * 100 for _ in range(100)]

for _ in range(n):
    x, y = map(int, input().split())
    for i in range(x, x + 10):
        for j in range(y, y + 10):
            board[i][j] = 1

for i in range(100):
    count = count + sum(board[i])

print(count)