n, k = map(int, input().split())
a = []
for _ in range(n):
    a.append(int(input()))

count = 0

for i in range(n):
    if a[i] > k or i == n - 1:
        coin = i
        break

while True:
    if k == 0:
        print(count)
        break
    if k // a[coin] > 0:
        count += k // a[coin]
        k = k % a[coin]
    else:
        coin -= 1
