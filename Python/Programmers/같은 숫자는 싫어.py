def solution(arr):
    answer = []
    for element in arr:
        if answer and answer[-1] == element:
            continue
        else:
            answer.append(element)
    return answer