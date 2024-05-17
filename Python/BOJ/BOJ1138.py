n = int(input())
hints = list(map(int, input().split()))

answer = [0] * n
for i in range(0, n):
    count = 0
    for j in range(0, n):
        if answer[j] == 0:
            count += 1
            if count > hints[i]:
                 answer[j] = i + 1
                 break

for num in answer:
    print(num, end = " ")
print()