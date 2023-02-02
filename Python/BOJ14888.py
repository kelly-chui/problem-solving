def backTracking(count):
    if count == n:
        return
    
    for i in ["+", "-", "*", "//"]:
        if operators[i] != 0:
            orders.append(i)
            backTracking(count + 1)
            orders.pop()
        

n = int(input())
a = list(map(int, input().split()))
operators = list(map(int, input().split()))
count = 0
orders = []
