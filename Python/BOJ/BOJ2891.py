n, s, r = map(int, input().split())
team = [1] * n
stat = [False] * n
answer = 0
no = list(map(int, input().split()))
yes = list(map(int, input().split()))

for t in no:
    team[t - 1] -= 1

for t in yes:
    team[t - 1] += 1

for idx in range(0, n):
    if team[idx] == 0:
        if idx > 0 and team[idx - 1] == 2:
            team[idx - 1] = 1
            answer += 1
        elif idx < n - 1 and team[idx + 1] == 2:
            team[idx + 1] = 1
            answer += 1
    else:
        answer += 1

print(n - answer)