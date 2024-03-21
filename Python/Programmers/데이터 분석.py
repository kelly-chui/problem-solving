def solution(data, ext, val_ext, sort_by):
    indexDict = {"code": 0, "date": 1, "maximum": 2, "remain": 3}
    answer = sorted(filter(lambda x: x[indexDict[ext]] < val_ext, data), key=lambda x: x[indexDict[sort_by]])
    return answer