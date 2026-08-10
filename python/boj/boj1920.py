n = int(input())
a = list(map(int, input().split()))
m = int(input())

numbers = list(map(int, input().split()))
a.sort()

for n in numbers:
    low = 0
    high = len(a) - 1
    isIn = False
    while low <= high:
        mid = (low + high) // 2
        if n == a[mid]:
            isIn = True
            break
        elif n > a[mid]:
            low = mid + 1
        else:
            high = mid - 1
    print(1 if isIn else 0)
