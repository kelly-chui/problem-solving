func solution(_ n:Int) -> Int {
    var dp = [Int](repeating: 0, count: n + 1)
    
    if n < 3 {
        if n == 1 { return 1 }
        if n == 2 { return 2 }
    } else {
        dp[1] = 1
        dp[2] = 2
        for idx in 3...n {
            dp[idx] = (dp[idx - 1] % 1234567 + dp[idx - 2] % 1234567) % 1234567
        }
    }
    
    return dp[n] % 1234567
}
