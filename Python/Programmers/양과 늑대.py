def dfs(currentNode, tree, info, visitedNodes, sheepCount, wolfCount):
    if info[currentNode] == 0:
        sheepCount += 1
    else:
        wolfCount += 1
    if sheepCount <= wolfCount:
        return 0
    answer = sheepCount
    for visitedNode in list(visitedNodes):
        for neighborNode in tree.get(visitedNode, []):
            if neighborNode in visitedNodes:
                continue
            visitedNodes.add(neighborNode)
            answer = max(answer, dfs(neighborNode, tree, info, visitedNodes, sheepCount, wolfCount))
            visitedNodes.remove(neighborNode)
    return answer
    
def solution(info, edges):
    tree = {}
    for idx in range(0, len(info)):
        tree[idx] = []
    for parent, child in edges:
        tree[parent].append(child)
    visitedNodes = set([0])
    answer = dfs(0, tree, info, visitedNodes, 0, 0)
    return answer
