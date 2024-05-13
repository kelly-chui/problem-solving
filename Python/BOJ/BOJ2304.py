n = int(input())
pillars = []
for _ in range(n):
    pillars.append(tuple(map(int, input().split())))

max_height = max(pillars, key = lambda x: x[0])
pillars.sort(key = lambda x: x[1])
print(pillars)
print(max_height)