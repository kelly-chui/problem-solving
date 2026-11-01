// https://leetcode.com/problems/twisted-mirror-path-count

class Solution {
    func uniquePaths(_ grid: [[Int]]) -> Int {
        let MOD = 1_000_000_007
        let m = grid.count
        let n = grid.first?.count ?? 0
        var dp = [[[Int]]](
            repeating: [[Int]](
                repeating: [0, 0],
                count: n
            ),
            count: m
        )
        dp[0][0][0] = 1
        dp[0][0][1] = 0
        for row in 0..<m {
            for col in 0..<n {
                if col > 0 {
                    if grid[row][col - 1] == 1 {
                        dp[row][col][0] = dp[row][col - 1][1]
                    } else {
                        dp[row][col][0] = (dp[row][col - 1][0] + dp[row][col - 1][1]) % MOD
                    } 
                }
                if row > 0 {
                    if grid[row - 1][col] == 1 {
                        dp[row][col][1] = dp[row - 1][col][0]
                    } else {
                        dp[row][col][1] = (dp[row - 1][col][0] + dp[row - 1][col][1]) % MOD
                    }
                }
            }
        }
        return (dp[m - 1][n - 1][0] + dp[m - 1][n - 1][1]) % MOD
    }
}
