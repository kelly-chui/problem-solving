n = int(input())
budgets = list(map(int, input().split()))
m = int(input())

low = 0
high = max(budgets)

while low <= high:
    mid = (low + high) // 2
    sum = 0

    for budget in budgets:
        if budget > mid:
            sum += mid
            if sum > m:
                break
        else:
            sum += budget
    
    if sum > m:
        high = mid - 1
    elif sum <= m:
        low = mid + 1

print(high)