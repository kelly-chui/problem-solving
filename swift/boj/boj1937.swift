func dfs(row: Int, col: Int) -> Int {
    guard dp[row][col] == 0 else { return dp[row][col] }
    var longestPathCount = 1
    for move in moves {
        let newRow = row + move.0
        let newCol = col + move.1
        guard 0..<n ~= newRow,
              0..<n ~= newCol,
              graph[newRow][newCol] > graph[row][col] else {
            continue
        }
        longestPathCount = max(longestPathCount, 1 + dfs(row: newRow, col: newCol))
    }
    dp[row][col] = longestPathCount
    return longestPathCount
}

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
var answer = 0

for row in 0..<n {
    for col in 0..<n {
        answer = max(answer, dfs(row: row, col: col))
    }
}

print(answer)
