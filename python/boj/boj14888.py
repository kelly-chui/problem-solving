def backTracking(count, current_value):
    global answer_max, answer_min
    if count == n:
        answer_max = max(answer_max, current_value)
        answer_min = min(answer_min, current_value)
    
    else:
        for i in range(4):
            if operators[i] > 0:
                operators[i] -= 1
                if i == 0:
                    backTracking(count + 1, current_value + a[count])
                elif i == 1:
                    backTracking(count + 1, current_value - a[count])
                elif i == 2:
                    backTracking(count + 1, current_value * a[count])
                else:
                    backTracking(count + 1, int(current_value / a[count]))
                operators[i] += 1
        
n = int(input())
a = list(map(int, input().split()))
operators = list(map(int, input().split()))
count = 0
answer_max = -1_000_000_000
answer_min = 1_000_000_000
backTracking(1, a[0])
print(answer_max)
print(answer_min)
