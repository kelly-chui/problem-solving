def solution(board, h, w):
    answer = 0
    moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    for move in moves:
        new_h = h + move[0]
        new_w = w + move[1]
        if new_h < 0 or new_h >= len(board) or new_w < 0 or new_w >= len(board[0]):
            continue
        if board[new_h][new_w] == board[h][w]:
            answer += 1
    return answer