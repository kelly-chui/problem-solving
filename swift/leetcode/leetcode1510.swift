// https://leetcode.com/problems/stone-game-iv

class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dp = [Bool](repeating: false, count: n + 1)
        dp[0] = false
        for remain in 1...n {
            var root = 1
            while root * root <= remain {
                if !dp[remain - root * root] {
                    dp[remain] = true
                    break
                }
                root += 1
            }
        }
        return dp[n]
    }
}
