n, m = map(int, input().split())
lectures = list(map(int, input().split()))

low = 1
high = sum(lectures)

while low < high:
    mid = (low + high) // 2
    sum = 0
    
    count = 1
    sum = 0
    i = 0
    while i < n:
        if count > m:
            break
        sum += lectures[i]
        if sum > mid:
            sum = 0
            count += 1
        else:
            i += 1
    
    if count > m:
        low = mid + 1
    else:
        high = mid
print(high)