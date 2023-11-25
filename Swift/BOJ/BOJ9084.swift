import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: m + 1)
    dp[0] = 1
    for coin in coins {
        if m >= coin {
            for idx in coin...m {
                dp[idx] += dp[idx - coin]
                if dp[idx] > 2_147_483_647 {
                    dp[idx] = 0
                }
            }
        }
    }
    print(dp[m])
}
