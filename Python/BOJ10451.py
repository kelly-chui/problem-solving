def dfs(v, start):
    isVisited[v] = True
    if not isVisited[permutation[v - 1]]:
        dfs(permutation[v - 1], start)

n = []
per = []
t = int(input())
for _ in range(t):
    n_temp = int(input())
    per_temp = list(map(int, input().split()))
    n.append(n_temp)
    per.append(per_temp)

for case in range(t):
    count = 0
    isVisited = [False] * (n[case] + 1)
    permutation = per[case]
    for i in range(1, n[case] + 1):
        if not isVisited[i]:
            dfs(i, i)
            count += 1
    print(count)