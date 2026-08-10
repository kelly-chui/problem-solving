import sys
from collections import defaultdict
sys.setrecursionlimit(100000)

def solution(tickets):
    answer = []
    graph = defaultdict(list)
    for a, b in tickets:
        graph[a].append(b)
    for key in graph:
        graph[key].sort(reverse = True)
    
    def dfs(airport):
        while graph[airport]:
            nextAirport = graph[airport].pop()
            dfs(nextAirport)
        answer.append(airport)
    dfs("ICN")
    return answer[::-1]
