import Foundation

let n = Int(readLine()!)!
var costs = [[Int]]()
for _ in 0..<n {
    costs.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var answer = 987_654_321
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: n), count: 3)
for start in 0..<3 {
    for _ in 0..<3 {
        dp[start][0] = [Int](repeating: 987_654_321, count: 3)
        dp[start][0][start] = costs[0][start]
    }
    for house in 1..<n {
        dp[start][house][0] = min(dp[start][house - 1][1], dp[start][house - 1][2]) + costs[house][0]
        dp[start][house][1] = min(dp[start][house - 1][0], dp[start][house - 1][2]) + costs[house][1]
        dp[start][house][2] = min(dp[start][house - 1][0], dp[start][house - 1][1]) + costs[house][2]
    }
    for end in 0..<3 {
        if end != start {
            answer = min(answer, dp[start][n - 1][end])
        } 
    }
}
print(answer)