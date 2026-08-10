// https://leetcode.com/problems/maximum-number-of-jumps-to-reach-the-last-index

class Solution {
    func maximumJumps(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var dp = [Int](repeating: -1, count: n)
        dp[0] = 0
        for i in 1..<n {
            for j in 0..<i {
                guard dp[j] != -1 else { continue }
                guard abs(nums[j] - nums[i]) <= target else { continue }
                dp[i] = dp[j] + 1 > dp[i] ? dp[j] + 1 : dp[i]
            }
        }
        return dp[n - 1]
    }
}
