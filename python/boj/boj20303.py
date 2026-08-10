def find(a):
    if a != parents[a]:
        parents[a] = find(parents[a])
    return parents[a]

def union(a, b):
    pa = find(a)
    pb = find(b)
    if pa == pb:
        return
    if size[pa] > size[pb]:
        parents[pb] = pa
        size[pa] += size[pb]
        c[pa] += c[pb]
    else:
        parents[pa] = pb
        size[pb] += size[pa]
        c[pb] += c[pa]

n, m, k = map(int, input().split())
c = [0] + list(map(int, input().split()))
parents = list(range(n + 1))
size = [1] * (n + 1)
for _ in range(m):
    a, b = map(int, input().split())
    union(a, b)

dp = [0] * k
for i in range(1, n + 1):
    if i == find(i):
        w = size[i]
        v = c[i]
        for j in range(k - 1, w - 1, - 1):
            dp[j] = max(dp[j], dp[j - w] + v)

print(max(dp))
