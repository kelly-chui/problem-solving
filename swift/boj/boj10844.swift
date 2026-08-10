import Foundation

let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
let mod = 1_000_000_000
for index in 1..<10 {
    dp[1][index] = 1
}

for i in 2..<n + 1 {
    for j in 0..<10 {
        if j == 0 {
            dp[i][j] = dp[i - 1][1]
        } else if j == 9 {
            dp[i][j] = dp[i - 1][8]
        } else {
            dp[i][j] = (dp[i - 1][j - 1] % mod + dp[i - 1][j + 1] % mod) % mod
        }
    }
}
print(dp[n].reduce(0) { $0 + $1 } % mod)
