import Foundation

func dfs(location: (Int, Int)) -> Int {
    if location == (m - 1, n - 1) {
        return 1
    }
    if dp[location.0][location.1] == -1 {
        dp[location.0][location.1] = 0
        for move in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
            let newLocation = (location.0 + move.0, location.1 + move.1)
            if newLocation.0 < 0 || newLocation.0 >= m || newLocation.1 < 0 || newLocation.1 >= n { continue }
            if graph[newLocation.0][newLocation.1] >= graph[location.0][location.1] { continue }
            dp[location.0][location.1] += dfs(location: newLocation)
        }
    }
    return dp[location.0][location.1]
}

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (mn[0], mn[1])
var graph: [[Int]] = []
for _ in 0..<m {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
print(dfs(location: (0, 0)))
