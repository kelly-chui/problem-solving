// https://leetcode.com/problems/removing-minimum-and-maximum-from-array

class Solution {
    func minimumDeletions(_ nums: [Int]) -> Int {
        let minValue = nums.min()!
        let maxValue = nums.max()!
        let maxIdx = nums.firstIndex { $0 == maxValue }!
        let minIdx = nums.firstIndex { $0 == minValue }!
        var answer = max(minIdx, maxIdx) + 1
        answer = min(answer, nums.count - min(minIdx, maxIdx))
        answer = min(answer, min(minIdx, maxIdx) + 1 + nums.count - max(minIdx, maxIdx))
        return answer
    }
}
