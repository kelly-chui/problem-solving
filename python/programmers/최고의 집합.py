def solution(n, s):
    if s < n:
        return [-1]
    q = s // n
    r = s % n
    answer = [q] * n
    for i in range(r):
        answer[i] += 1
    return sorted(answer)
