class DisjointSet:
    def __init__(self, size):
        self.parent = [i for i in range(size)]
    def union(self, x, y):
        parentX = self.find(x)
        parentY = self.find(y)
        if parentX != parentY:
            self.parent[parentY] = parentX
    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]
        
def solution(n, costs):
    answer = 0
    djSet = DisjointSet(n)
    costs.sort(key = lambda x: x[2])
    for cost in costs:
        if djSet.find(cost[0]) != djSet.find(cost[1]):
            djSet.union(cost[0], cost[1])
            answer += cost[2]
    return answer
