import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: -1, count: 100_001)
dp[2] = 1
dp[4] = 2
dp[5] = 1

if n < 6 {
    print(dp[n])
    exit(0)
}

for index in 6...n {
    let currentCase = (dp[index - 2] > 0, dp[index - 5] > 0)
    if currentCase == (true, true) {
        dp[index] = min(dp[index - 2], dp[index - 5]) + 1
    } else if currentCase == (true, false) {
        dp[index] = dp[index - 2] + 1
    } else if currentCase == (false, true) {
        dp[index] = dp[index - 5] + 1
    }
}

print(dp[n])
