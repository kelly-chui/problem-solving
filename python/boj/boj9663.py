def check(row_idx):
    for idx in range(row_idx):
        if rows[row_idx] == rows[idx] or abs(rows[row_idx] - rows[idx]) == row_idx - idx:
            return False
    return True

def backTracking(row_idx):
    global answer
    if row_idx == n:
        answer += 1
    else:
        for column in range(n):
            rows[row_idx] = column
            if check(row_idx):
                backTracking(row_idx + 1)

n = int(input())
rows = [0] * n
answer = 0

backTracking(0)
print(answer)
