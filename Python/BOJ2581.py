m = int(input())
n = int(input())
sum = 0
min = 0

for i in range(m, n + 1):
    if i == 1:
        continue
    if i == 2:
        sum += i
        min = i
        continue
    isPrime = True
    temp = 1
    while(temp * temp <= i):
        if temp == 1:
            temp += 1
            continue
        elif i % temp == 0:
            isPrime = False
            break
        temp += 1

    if isPrime:
        sum += i
        if min == 0:
            min = i

if sum == 0:
    print("-1")
else:
    print(sum)
    print(min)