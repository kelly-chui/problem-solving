# Kelly Chui
# Jul 24, 2022
# BOJ1931

n = int(input())
#print(n)

timeList = []
for i in range(n):
    timeList.append(list(map(int, input().split())))
# 정렬
sortedListEnd = sorted(timeList, key=lambda x: (x[1], x[0]))

pointer = sortedListEnd[0][1]
count = 1
i = 1
while(i < n):
    if sortedListEnd[i][0] >= pointer:
        count = count + 1
        pointer = sortedListEnd[i][1]
    i = i + 1

print(count)