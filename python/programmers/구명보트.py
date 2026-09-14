# https://school.programmers.co.kr/learn/courses/30/lessons/42885

def solution(people, limit):
    answer = 0
    people.sort()
    start = 0
    end = len(people) - 1
    while start <= end:
        if start == end:
            answer += 1
            break
        if people[end] + people[start] <= limit:
            start += 1
        end -= 1
        answer += 1
    return answer
