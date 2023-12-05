board = []
moves = [(1, 0), (0 , 1), (1, 1), (-1 , 1)]
isFin = False

for _ in range(19):
    board.append(list(map(int, input().split())))

for row in range(19):
    for column in range(19):
        if board[row][column] != 0:
            color = board[row][column]
            for move in moves:
                count = 1
                tempRow = row
                tempColumn = column
                for _ in range(4):
                    tempRow += move[0]
                    tempColumn += move[1]
                    if tempRow < 0 or tempRow > 18 or tempColumn < 0 or tempColumn > 18:
                        break
                    if board[tempRow][tempColumn] == color:
                        count += 1
                    else:
                        break
                if count == 5:
                    back = (row - move[0], column - move[1])
                    front = (row + move[0] * 5, column + move[1] * 5)
                    if back[0] < 0 or back[0] > 18 or back[1] < 0 or back[1] > 18:
                        if board[front[0]][front[1]] == color:
                            continue
                    elif front[0] < 0 or front[0] > 18 or front[1] < 0 or front[1] > 18:
                        if board[back[0]][back[1]] == color:
                            continue
                    else:
                        if board[back[0]][back[1]] == color or board[front[0]][front[1]] == color:
                            continue
                    
                    isFin = True
                    print(color)
                    print(row + 1, column + 1)
if not isFin:
    print(0)