// https://leetcode.com/problems/minimum-moves-to-make-array-complementary

class Solution {
    func minMoves(_ nums: [Int], _ limit: Int) -> Int {
        let n = nums.count
        var diff = Array(repeating: 0, count: 2 * limit + 2)
        for i in 0..<n / 2 {
            let a = nums[i]
            let b = nums[n - 1 - i]
            let low = min(a, b) + 1
            let high = max(a, b) + limit
            let sum = a + b
            diff[2] += 2
            diff[2 * limit + 1] -= 2
            diff[low] -= 1
            diff[high + 1] += 1
            diff[sum] -= 1
            diff[sum + 1] += 1
        }
        var answer = Int.max
        var current = 0
        for target in 2...(2 * limit) {
            current += diff[target]
            answer = min(answer, current)
        }
        return answer
    }
}
