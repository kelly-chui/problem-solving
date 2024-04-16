let n = Int(readLine()!)!
var time = [Int](repeating: 0, count: n + 1)
var price = [Int](repeating: 0, count: n + 1)
var dp = [Int](repeating: 0, count: n + 2)

for i in 1...n {
    let tp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (t, p) = (tp[0], tp[1])
    time[i] = tp[0]
    price[i] = tp[1]
    dp[i] = price[i]
}

for i in stride(from: n, through: 1, by: -1){
    if time[i] + i <= n + 1{
        dp[i] = max(dp[i + 1], dp[i + time[i]] + price[i])
    }else {
        dp[i] = dp[i + 1]
    }
}
print(dp.max()!)
