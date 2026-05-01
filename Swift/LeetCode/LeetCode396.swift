// https://leetcode.com/problems/rotate-function

class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        let n = nums.count
        let totalSum = nums.reduce(0) { $0 + $1 }
        var current = nums.enumerated().reduce(0) { $0 + $1.offset * $1.element }
        var answer = current
        for i in 1..<n {
            current = current + totalSum - (n * nums[n - i]) 
            answer = max(answer, current)
        }
        return answer
    }
}
