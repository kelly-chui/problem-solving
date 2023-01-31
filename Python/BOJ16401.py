m, n = map(int, input().split())
snacks = list(map(int, input().split()))

low = 0
high = 1_000_000_000 + 1
result = 0
isZero = False

while low <= high:
    if isZero:
        break
    mid = (low + high) // 2
    sum = 0
    for snack in snacks:
        if mid == 0:
            isZero = True
            break
        sum += snack // mid
    if sum >= m:
        result = max(result, mid)
        low = mid + 1
    else:
        high = mid - 1

print(0 if isZero else result)
