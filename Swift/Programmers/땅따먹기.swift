import Foundation

func solution(_ land:[[Int]]) -> Int {
    var answer = 0
    var dp = land
    
    if land.count == 1 {
        return land[0].max()!
    }
    
    dp[0] = land[0]
    
    for i in 1..<land.count {
        for j in 0..<4 {
            if j == 0 {
                dp[i][j] += max(dp[i - 1][1], dp[i - 1][2], dp[i - 1][3])
            } else if j == 1 {
                dp[i][j] += max(dp[i - 1][0], dp[i - 1][2], dp[i - 1][3])
            } else if j == 2 {
                dp[i][j] += max(dp[i - 1][1], dp[i - 1][0], dp[i - 1][3])
            } else if j == 3 {
                dp[i][j] += max(dp[i - 1][1], dp[i - 1][2], dp[i - 1][0])
            }
        }
    }
    answer = dp[land.count - 1].max()!
    return answer
}
