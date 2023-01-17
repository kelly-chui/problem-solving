sums = []
t = int(input())
for i in range(t):
    n, m = map(int, input().split())
    listA = list(map(int, input().split()))
    listB = list(map(int, input().split()))
    listA.sort()
    listB.sort()
    sum = 0
    for a in listA:
        low = 0
        high = m
        while low < high:
            mid = (low + high) // 2
            if listB[mid] < a:
                low = mid + 1
            else:
                high = mid
        sum += low
    sums.append(sum)

for sum in sums:
    print(sum)