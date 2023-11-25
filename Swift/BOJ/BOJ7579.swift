import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let memories = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
let costs = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [[Int]](repeating: [Int](repeating: 0, count: 10001), count: 101)
var answer = 987_654_321
for i in 1...n {
    for j in 0...10000 {
        if j >= costs[i] {
            dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - costs[i]] + memories[i])
        } else {
            dp[i][j] = dp[i - 1][j]
        }
        if dp[i][j] >= m {
            answer = min(answer, j)
        }
    }
}
print(answer)
