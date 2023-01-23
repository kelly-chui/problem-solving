n = int(input())

count = 0
numbering = 666

# while True:
#     if "666" in str(numbering):
#         count += 1
#     if count == n:
#         print(numbering)
#         break
#     numbering += 1

while count != n:
    temp = numbering
    while temp >= 666:
        if temp % 1000 == 666:
            count += 1
            break
        else:
            temp = temp // 10
    numbering = (numbering + 1 if n != count else numbering)

print(numbering)