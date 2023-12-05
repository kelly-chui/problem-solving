k, n = map(int, input().split())
cables = []
for i in range(k):
    cables.append(int(input()))

low = 1
high = max(cables)

while low <= high:
    mid = (low + high) // 2
    sum = 0
    for cable in cables:
        sum += cable // mid
        if sum > n:
            break
    if n > sum:
        high = mid - 1
    else:
        low = mid + 1

print(high)
