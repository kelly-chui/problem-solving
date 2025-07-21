def solution(gems):
    answer = [0, len(gems) - 1]
    gemCount = len(set(gems))
    currentGems = {}
    start = 0
    end = 0
    currentGems[gems[end]] = 1
    while end < len(gems):
        if len(currentGems) < gemCount:
            end += 1
            if end >= len(gems):
                break
            if gems[end] in currentGems:
                currentGems[gems[end]] += 1
            else:
                currentGems[gems[end]] = 1
        else:
            if answer[1] - answer[0] > end - start:
                answer = [start, end]
            currentGems[gems[start]] -= 1
            if currentGems[gems[start]] == 0:
                del currentGems[gems[start]]
            start += 1
    return list(map(lambda x: x + 1, answer))
