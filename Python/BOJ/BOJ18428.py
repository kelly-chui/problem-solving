def dfs(start):
    if o_num == 3:
        if check():
            print("YES")
            exit()
        return
    for idx in range(start, len(blanks)):
        blank = blanks[idx]
        graph[blank[0]][blank[1]] = "O"
        o_num += 1
        dfs(idx + 1)
        graph[blank[0]][blank[1]] = "X"
        o_num -= 1

def check():
    for teacher in teachers:
        cur_row, cur_column = teacher[0], teacher[1]

        for new_row in range(cur_row, -1, -1):
            if graph[new_row][cur_column] == "S":
                return False
            elif graph[new_row][cur_column] == "O":
                break

        for new_row in range(cur_row, n):
            if graph[new_row][cur_column] == "S":
                return False
            elif graph[new_row][cur_column] == "O":
                break

        for new_column in range(cur_column, -1, -1):
            if graph[cur_row][new_column] == "S":
                return False
            elif graph[cur_row][new_column] == "O":
                break

        for new_column in range(cur_column, n):
            if graph[cur_row][new_column] == "S":
                return False
            elif graph[cur_row][new_column] == "O":
                break
        return True

n = int(input())
graph = []
for _ in range(n):
    graph.append(list(input().split()))

blanks = []
teachers = []
o_num = 0

for row in range(n):
    for column in range(n):
        if graph[row][column] == "X":
            blanks.append((row, column))
        elif graph[row][column] == "T":
            teachers.append((row, column))

print("NO")