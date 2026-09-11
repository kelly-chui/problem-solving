# https://school.programmers.co.kr/learn/courses/30/lessons/12924

def solution(n):
    answer = 0
    start = 1
    end = 1
    current = 1
    while start <= n:
        if current == n:
            answer += 1
            current -= start
            start += 1
        elif current > n:
            current -= start
            start += 1
        else:  # current < n
            end += 1
            current += end
    return answer
