import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var values: [Int] = []
for _ in 0..<n {
    values.append(Int(readLine()!)!)
}
var dp = [Int](repeating: 0, count: k + 1)
dp[0] = 1
for value in values {
    if k >= value {
        for idx in value...k {
            dp[idx] += dp[idx - value]
            if dp[idx] >= 2_147_483_648 {
                dp[idx] = 0
            }
        }
    }
}
print(dp[k])
