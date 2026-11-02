// https://leetcode.com/problems/minimum-moves-to-equal-array-elements-ii

class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted { $0 < $1 }
        let median = sortedNums[nums.count / 2]
        return nums.reduce(0) { $0 + abs($1 - median) }
    }
}
