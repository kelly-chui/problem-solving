n, m = map(int, input().split())
d = set()
b = set()
for _ in range(n):
    d.add(input())
for _ in range(m):
    b.add(input())

dbj = sorted(list(d & b))
print(len(dbj))
for name in dbj:
    print(name)