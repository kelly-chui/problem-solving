n = int(input())

low = 0
high = 2 ** 32
while low < high:
    mid = (low + high) // 2
    if mid * mid >= n:
        high = mid
    else:
        low = mid + 1
print(high)