# Kelly Chui
# Jul 22, 2022
# BOJ 2447

def star(starlist):
    if len(starlist) == 3:
        starlist[1][1] = " "
        return starlist

    else:
        div1 = len(starlist) // 3
        div2 = len(starlist) // 3 * 2

        for index in range(div1, div2):
            for j in range(div1, div2):
                starlist[index][j] = " "

        r1c1 = star([row[0:div1] for row in starlist[0:div1]])
        r1c2 = star([row[0:div1] for row in starlist[div1:div2]])
        r1c3 = star([row[0:div1] for row in starlist[div2:]])

        r2c1 = star([row[div1:div2] for row in starlist[0:div1]])
        r2c3 = star([row[0:div1] for row in starlist[div1:div2]])

        r3c1 = star([row[div2:] for row in starlist[0:div1]])
        r3c2 = star([row[div2:] for row in starlist[div1:div2]])
        r3c3 = star([row[div2:] for row in starlist[div2:]])

        for i in range(div1):
            starlist[i][0:div1] = r1c1[i]
            starlist[i][div1:div2] = r1c2[i]
            starlist[i][div2:] = r1c3[i]

        for i in range(div1, div2):
            starlist[i][0:div1] = r2c1[i - div1]
            starlist[i][div2:] = r2c3[i - div1]

        for i in range(div2, div2 + div1):
            starlist[i][0:div1] = r3c1[i - div2]
            starlist[i][div1:div2] = r3c2[i - div2]
            starlist[i][div2:] = r3c3[i - div2]

        return starlist


N = int(input())
starlist = []
starlist2 = []
for i in range(N):
    starlist.append(["*" for j in range(N)])
printstar = star(starlist)

for i in range(N):
    for j in range(N):
        print(printstar[i][j], end="")
    print()
    