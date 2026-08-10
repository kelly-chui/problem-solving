// https://leetcode.com/problems/check-if-array-is-good

class Solution {
    func isGood(_ nums: [Int]) -> Bool {
        return nums.sorted() == Array(1..<nums.count) + [nums.count - 1]
    }
}
