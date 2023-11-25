import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let k = Int(readLine()!)!
    let fileSizes = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: k + 1)
    var ps = fileSizes
    for i in 1...k {
        ps[i] += ps[i - 1]
    }
    for l in 1...k {
        for s in stride(from: 1, to: k - l + 1, by: 1) {
            dp[s][s + l] = 987_654_321
            for m in s..<s + l {
                dp[s][s + l] = min(dp[s][s + l], dp[s][m] + dp[m + 1][s + l] + ps[s + l] - ps[s - 1])
            }
        }
    }
    print(dp[1][k])
}
