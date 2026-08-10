// https://leetcode.com/problems/minimum-score-of-a-path-between-two-cities

class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var graph = [Int: [(Int, Int)]]()
        var answer = Int.max
        var visited = Set<Int>()
        for road in roads {
            let (a, b, distance) = (road[0], road[1], road[2])
            graph[a, default: []].append((b, distance))
            graph[b, default: []].append((a, distance))
        }
        func dfs(current: Int) {
            visited.insert(current)
            for (nextNode, nextDistance) in graph[current] ?? [] {
                answer = answer > nextDistance ? nextDistance : answer
                if !visited.contains(nextNode) {
                    dfs(current: nextNode)
                }
            }
        }
        dfs(current: 1)
        return answer
    }
}
