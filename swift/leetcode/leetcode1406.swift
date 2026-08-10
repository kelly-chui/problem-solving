// https://leetcode.com/problems/stone-game-iii

class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        let n = stoneValue.count
        var dp = [Int](repeating: 0, count: n)
        for i in stride(from: n - 1, to: -1, by: -1) {
            var best = stoneValue[i] - (i + 1 < n ? dp[i + 1] : 0)
            if i + 1 < n {
                best = max(best, stoneValue[i] + stoneValue[i + 1] - (i + 2 < n ? dp[i + 2] : 0))
            }
            if i + 2 < n {
                best = max(best, stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - (i + 3 < n ? dp[i + 3] : 0))
            }
            dp[i] = best
        }
        switch dp[0] {
        case let x where x > 0:
            return "Alice"
        case let x where x < 0:
            return "Bob"
        default:
            return "Tie"
        }
    }
}
