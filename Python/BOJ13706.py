n = int(input())

low = 1
high = n

while low < high:
    mid = (high + low) // 2
    if mid * mid == n:
        print(mid)
        break
    elif mid * mid < n:
        low = mid + 1
    else:
        high = mid - 1