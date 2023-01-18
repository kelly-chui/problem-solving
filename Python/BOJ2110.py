n, c = map(int, input().split())
x = []
for _ in range(n):
    x.append(int(input()))
x.sort()

low = 1
high = x[-1] - x[0] + 1
while low < high:
    mid = (low + high) // 2

    count = 1
    start = x[0]
    for xi in x:
        if xi - start >= mid:
            start = xi
            count += 1
    if count >= c:
        low = mid + 1
    else:
        high = mid
print(high - 1)