def solution(n, m, section):
    answer = 0
    painted = 0
    for idx in section:
        if idx >= painted:
            painted = idx + m
            answer += 1
    return answer

print(solution(8, 4, [2, 3, 6]))
