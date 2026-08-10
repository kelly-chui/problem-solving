var n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
var reversedA = Array(a.reversed())
var dp = [Int](repeating: 1, count: n)
var reversedDp = [Int](repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if a[i] > a[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

for i in 0..<n {
    for j in 0..<i {
        if reversedA[i] > reversedA[j] {
            reversedDp[i] = max(reversedDp[i], reversedDp[j] + 1)
        }
    }
}

print(zip(dp, reversedDp.reversed()).map { $0 + $1 }.max()! - 1)
