n = int(input())
cards = list(map(int, input().split()))
m = int(input())
numbers = list(map(int, input().split()))

cards.sort()
for n in numbers:
    low = 0
    high = len(cards) - 1
    isIn = False
    while low <= high:
        mid = (low + high) // 2
        if n == cards[mid]:
            isIn = True
            break
        elif n > cards[mid]:
            low = mid + 1
        else:
            high = mid - 1
    print(1 if isIn else 0)
