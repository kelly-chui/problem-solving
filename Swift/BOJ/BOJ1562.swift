let MOD = 1_000_000_000
let n = Int(readLine()!)!

var dp = [[[Int]]](repeating: [[Int]](repeating:[Int](repeating: 0, count: 1024), count: 10), count: n + 1)
for digit in 1...9 {
    dp[1][digit][1 << digit] = 1
}
for i in 1...n {
    for j in 0...9 {
        for k in 0...1023 {
            if j > 0 {
                dp[i][j][k | (1 << j)] = (dp[i][j][k | (1 << j)] + dp[i - 1][j - 1][k]) % MOD
            }
            if j < 9 {
                dp[i][j][k | (1 << j)] = (dp[i][j][k | (1 << j)] + dp[i - 1][j + 1][k]) % MOD
            }
        }
    }
}
var answer = 0
for digit in 0...9 {
    answer = (answer + dp[n][digit][1023]) % MOD
}
print(answer)
