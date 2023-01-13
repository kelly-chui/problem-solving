x, y = map(int, input().split())
z = int((y * 100 / x))

if z >= 99:
    print(-1)
else:
    low = 1
    high = x
    while low < high:
        mid = (low + high) // 2
        winRate = int((y + mid) * 100 / (x + mid))
        if winRate == z:
            low = mid + 1
        else:
            high = mid
    print(high)