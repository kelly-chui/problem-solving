n, m = map(int, input().split())
trees = list(map(int, input().split()))

low = 0
high = max(trees)
while low <= high:
    mid = (low + high) // 2
    sum = 0

    for tree in trees:
        if tree >= mid:
            sum += tree - mid
            if sum > m:
                break

    if sum >= m:
        low = mid + 1
    else:
        high = mid - 1
print(high)