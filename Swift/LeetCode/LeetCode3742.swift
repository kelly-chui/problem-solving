# https://leetcode.com/problems/maximum-path-score-in-a-grid

class Solution {
    func maxPathScore(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        var dp = [[Int]](
            repeating: [Int](repeating: -1, count: k + 1),
            count: n
        )
        let start = grid[0][0]
        if start == 0 {
            dp[0][0] = 0
        } else if k >= 1 {
            dp[0][1] = start
        }
        for row in 0..<m {
            var newDp = [[Int]](
                repeating: [Int](repeating: -1, count: k + 1),
                count: n
            )
            for col in 0..<n {
                if row == 0 && col == 0 {
                    newDp[0] = dp[0]
                    continue
                }
                let value = grid[row][col]
                let cellCost = value == 0 ? 0 : 1
                guard cellCost <= k else { continue }
                for cost in cellCost...k {
                    var best = -1
                    if row > 0 {
                        best = max(best, dp[col][cost - cellCost])
                    }
                    if col > 0 {
                        best = max(best, newDp[col - 1][cost - cellCost])
                    }
                    if best != -1 {
                        newDp[col][cost] = best + value
                    }
                }
            }
            dp = newDp
        }
        return dp[n - 1].max() ?? -1
    }
}
