// https://leetcode.com/problems/predict-the-winner

class Solution {
    func predictTheWinner(_ nums: [Int]) -> Bool {
        let n = nums.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for idx in 0..<n {
            dp[idx][idx] = nums[idx]
        }
        guard n >= 2 else { return true }
        for leng in 2...n {
            for left in 0...(n - leng) {
                let right = left + leng - 1
                let takeLeft = nums[left] - dp[left + 1][right]
                let takeRight = nums[right] - dp[left][right - 1]
                dp[left][right] = max(takeLeft, takeRight)
            }
        }
        return dp[0][n - 1] >= 0
    }
}
