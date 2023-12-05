# Kelly Chui
# Jul 24, 2022
# BOJ10986

def combination(n):
    return (n * (n - 1)) / 2

n, m = map(int, input().split())

listA = list(map(int, input().split()))
listSubtotal = []
listCount = [0 for i in range(m)]
count = 0

# Make Subtotal
listSubtotal.append(0)
listCount[0] = listCount[0] + 1
for i in range(n):
    x = (listSubtotal[i] + listA[i]) % m
    listSubtotal.append(x)
    listCount[x] = listCount[x] + 1

for i in range(m):
    if listCount[i] > 1:
        count = count + combination(listCount[i])

print(int(count))