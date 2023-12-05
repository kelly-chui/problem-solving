import sys

def backTracking(count, pointer):
    global isTeam1, answer
    if count == n // 2:
        team1 = 0
        team2 = 0
        for i in range(n):
            for j in range(n):
                if isTeam1[i] and isTeam1[j]:
                    team1 += s[i][j]
                elif not isTeam1[i] and not isTeam1[j]:
                    team2 += s[i][j]
        answer = min(answer, abs(team1- team2))
        return

    for i in range(pointer, n):
        if isTeam1[i]:
            continue
        isTeam1[i] = True
        backTracking(count + 1, i + 1)
        isTeam1[i] = False
        
s = []
n = int(sys.stdin.readline())
for _ in range(n):
    s.append(list(map(int, sys.stdin.readline().split())))

answer = 10_001
team_list = []
isTeam1 = [False for _ in range(n + 1)]
backTracking(0, 0)

print(answer)
