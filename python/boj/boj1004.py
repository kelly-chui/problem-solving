def calDistance(p1, p2):
    return ((p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2) ** 0.5

t = int(input())
for _ in range(t):
    answer = 0
    x1, y1, x2, y2 = map(int, input().split())
    n = int(input())
    for _ in range(n):
        cx, cy, r = map(int, input().split())
        answer += (calDistance((x1, y1), (cx, cy)) < r) ^ (calDistance((x2, y2), (cx, cy)) < r)
    print(answer)
