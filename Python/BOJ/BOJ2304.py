n = int(input())
pillars = [0] * 1001

max_pillar_idx = 0
max_height = 0
for _ in range(n):
    l, h = map(int, input().split())
    pillars[l] = h
    if max_height < h:
        max_height = h
        max_pillar_idx = l

answer = 0
cur_height = 0
for idx in range(max_pillar_idx + 1):
    cur_height = max(cur_height, pillars[idx])
    answer += cur_height

cur_height = 0
for idx in range(1000, max_pillar_idx, -1):
    cur_height = max(cur_height, pillars[idx])
    answer += cur_height

print(answer)