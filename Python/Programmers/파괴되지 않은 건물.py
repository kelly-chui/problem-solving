def solution(board, skill):
    answer = 0
    n = len(board)
    m = len(board[0])
    diff = [[0] * (m + 2) for _ in range(n + 1)]
    for skillType, r1, c1, r2, c2, degree in skill:
        delta = -degree if skillType == 1 else degree
        diff[r1][c1] += delta
        diff[r1][c2 + 1] -= delta
        diff[r2 + 1][c1] -= delta
        diff[r2 + 1][c2 + 1] += delta
    for i in range(n + 1):
        for j in range(1, m + 1):
            diff[i][j] += diff[i][j - 1]
    for j in range(m + 1):
        for i in range(1, n + 1):
            diff[i][j] += diff[i - 1][j]
    for i in range(n):
        for j in range(m):
            board[i][j] += diff[i][j]
            if board[i][j] > 0:
                answer += 1
    return answer
