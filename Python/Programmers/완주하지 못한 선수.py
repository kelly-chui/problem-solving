def solution(participant, completion):
    partiDict = {}
    comDict = {}
    answer = ""
    
    for par in participant:
        if par in partiDict:
            partiDict[par] += 1
        else:
            partiDict[par] = 1
    
    for com in completion:
        if com in comDict:
            comDict[com] += 1
        else:
            comDict[com] = 1
    
    for name in participant:
        if not name in comDict:
            answer = name
            break
        elif comDict[name] != partiDict[name]:
            answer = name
            break
            
    return answer

print(solution(["leo", "kiki", "eden"], ["eden", "kiki"]))
