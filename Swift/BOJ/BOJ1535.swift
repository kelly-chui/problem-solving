let n = Int(readLine()!)!
let decrease = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let pleasure = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var dp = [[Int]](repeating: [Int](repeating: 0, count: 100), count: n + 1)
for i in 1...n {
    for d in 0..<100 {
        dp[i][d] = dp[i - 1][d]
        let cost = decrease[i]
        if cost <= d {
            dp[i][d] = max(dp[i][d], dp[i - 1][d - cost] + pleasure[i])
        }
    }
}
print(dp[n][99])
