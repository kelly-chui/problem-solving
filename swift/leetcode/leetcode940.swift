// https://leetcode.com/problems/distinct-subsequences-ii

class Solution {
    func distinctSubseqII(_ s: String) -> Int {
        let MOD = 1_000_000_007
        var dp = 1
        var last = [Character: Int]()
        for c in s {
            let doubled = (dp % MOD) * 2 % MOD
            let newDp: Int
            if let prev = last[c] {
                newDp = (doubled - prev + MOD) % MOD
            } else {
                newDp = doubled
            }
            last[c] = dp % MOD
            dp = newDp
        }
        return (dp - 1 + MOD) % MOD
    }
}
