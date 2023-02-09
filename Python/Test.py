n = int(input())
p = list(map(int, input().split()))
np = []
count = 0

for i in range(len(p)):
    np.append((i, p[i]))

np = sorted(np, key = lambda x: x[1])

for i in range(len(np)):
    count += np[i][1] * (len(np) - i)
print(count)