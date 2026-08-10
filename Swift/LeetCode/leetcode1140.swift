// https://leetcode.com/problems/stone-game-ii

class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        let suffix = piles.indices.reversed().reduce(
            into: [Int](repeating: 0, count: piles.count + 1)
        ) { acc, i in
            acc[i] = acc[i + 1] + piles[i]
        }
        var dp = [[Int]](
            repeating: [Int](
                repeating: 0, count: piles.count + 1
            ),
            count: piles.count
        )
        for i in (0..<piles.count).reversed() {
            for m in 1...piles.count {
                for x in 1...(2 * m) {
                    guard i + x < piles.count else { 
                        dp[i][m] = max(dp[i][m], suffix[i])
                        break 
                    }
                    dp[i][m] = max(dp[i][m], suffix[i] - dp[i + x][max(m, x)])
                }
            }
        }
        return dp[0][1]
    }
}
