// https://leetcode.com/problems/left-and-right-sum-differences

class Solution {
    func leftRightDifference(_ nums: [Int]) -> [Int] {
        var answer = [Int](repeating: 0, count: nums.count)
        let totalSum = nums.reduce(0) { $0 + $1 }
        var leftSum = 0
        for idx in 0..<nums.count {
            let rightSum = totalSum - leftSum - nums[idx]
            answer[idx] = abs(leftSum - rightSum)
            leftSum += nums[idx]
        }
        return answer
    }
}
