# https://leetcode.com/problems/find-subtree-sizes-after-changes

class Solution:
    def findSubtreeSizes(self, parent: List[int], s: str) -> List[int]:
        n = len(parent)
        graph = [[] for _ in range(n)]
        for child, p in enumerate(parent):
            if p != -1:
                graph[p].append(child)
        
        lastSeen = {}
        newParent = parent[:]
        def dfs(node: int) -> None:
            char = s[node]
            previous = lastSeen.get(char)
            if previous is not None:
                newParent[node] = previous
            lastSeen[char] = node
            for child in graph[node]:
                dfs(child)
            if previous is None:
                del lastSeen[char]
            else:
                lastSeen[char] = previous

        dfs(0)

        newGraph = [[] for _ in range(n)]
        for child, p in enumerate(newParent):
            if p != -1:
                newGraph[p].append(child)
        answer = [1] * n

        def dfs2(node: int) -> None:
            for child in newGraph[node]:
                dfs2(child)
                answer[node] += answer[child]

        dfs2(0)

        return answer
