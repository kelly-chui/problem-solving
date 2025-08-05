def dfs(player, graph, visited):
    for competitor in graph[player]:
        if competitor not in visited:
            visited.add(competitor)
            dfs(competitor, graph, visited)

def solution(n, results):
    answer = 0
    win = [[] for _ in range(n + 1)]
    lose = [[] for _ in range(n + 1)]
    for winner, loser in results:
        win[winner].append(loser)
        lose[loser].append(winner)
    for player in range(1, n + 1):
        winFrom = set()
        loseFrom = set()
        dfs(player, win, winFrom)
        dfs(player, lose, loseFrom)
        if len(winFrom) + len(loseFrom) == n - 1:
            answer += 1
    return answer
