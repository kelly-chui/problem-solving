n = int(input())
k = int(input())

low = 1
high = k

while low < high:
    mid = (low + high) // 2
    sum = 0
    for i in range(1, n + 1):
        sum += min(mid // i, n)
    if sum >= k:
        high = mid
    else:
        low = mid + 1
print(low)