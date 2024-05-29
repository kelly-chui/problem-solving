def dfs(root, count, isVisited):
    if not isVisited[table[root]]:
        isVisited[table[root]] = True
        dfs(table[root], count + 1, isVisited)
    

n = int(input())
table = [-1]

for _ in range(n):
    table.append(int(input()))

for root in range(1, n + 1):
    isVisited = [False] * (n + 1)
    count = dfs(root, 0, isVisited)
