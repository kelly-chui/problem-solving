n, k = map(int, input().split())
rank = []
for _ in range(n):
    region, gold, silver, bronze = map(int, input().split())
    rank.append((region, (-gold, -silver, -bronze)))
rank.sort(key = lambda x: x[1])
table = [0] * (n + 1)

table[rank[0][0]] = 1
pre_medal = rank[0][1]
pre_rank = 1
for count in range(1, n):
    if rank[count][1] == pre_medal:
        table[rank[count][0]] = pre_rank
    else:
        table[rank[count][0]] = count + 1
        pre_medal = rank[count][1]
        pre_rank = count + 1
print(table[k])