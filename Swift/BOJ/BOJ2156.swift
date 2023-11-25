import Foundation

let n = Int(readLine()!)!
var glasses: [Int] = []
for _ in 0..<n {
    glasses.append(Int(readLine()!)!)
}
var dp = [Int](repeating: 0, count: n)
dp[0] = glasses[0]

if n > 1 {
    dp[1] = glasses[0] + glasses[1]
}
if n > 2 {
    dp[2] = glasses[0] + glasses[1] + glasses[2] - min(glasses[0], glasses[1], glasses[2])
}
if n > 3 {
    for index in 3..<n {
        dp[index] = max(dp[index - 1], dp[index - 3] + glasses[index - 1] + glasses[index], dp[index - 2] + glasses[index])
    }
}

print(dp[n - 1])
