def check(row_locations, column_locations, row, column):
    for i, j in zip(row_locations, column_locations):
        if abs(row - i) == abs(column - j):
            return True
    return False

def backTracking(row_locations, column_locations, count):
    print(count)
    if count == n:
        answer += 1
        return
    
    for row in range(n):
        for column in range(n):
            if row in row_locations or column in column_locations or check(row_locations, column_locations, row, column):
                continue
            else:
                row_locations.append(row)
                column_locations.append(column)
                backTracking(row_locations, column_locations, count + 1)


n = int(input())
row_locations = []
column_locations = []
answer = 0
backTracking(row_locations, column_locations, 0)
print(answer)