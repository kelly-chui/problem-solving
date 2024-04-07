n, m, l, k = map(int, input().split())

stars = []
for _ in range(k):
    x, y = map(int, input().split())
    stars.append((x, y))

bounce = 0
for starA in stars:
    for starB in stars:
        count = 0
        for starC in stars:
            if starA[0] <= starC[0] and starC[0] <= starA[0] + l and\
            starB[1] <= starC[1] and starC[1] <= starB[1] + l:
                count += 1
            if count > bounce:
                bounce = count

print(k - bounce)