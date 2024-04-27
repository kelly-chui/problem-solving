p = int(input())
for _ in range(p):
    count = 0
    line = []
    order = list(map(int, input().split()))
    t = order[0]
    for i in range(1, len(order)):
        a = False
        for j in range(0, len(line)):
            if order[i] < line[j]:
                line.insert(j, order[i])
                count += (len(line) - j - 1)
                a = True
                break
        if not a:
            line.append(order[i])
    
    print(t, count)