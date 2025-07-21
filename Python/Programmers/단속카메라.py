def solution(routes):
    answer = 0
    routes.sort(key = lambda x: x[1])
    currentCamera = -30000
    for route in routes:
        if route[0] > currentCamera:
            answer += 1
            currentCamera = route[1]
    
    return answer
