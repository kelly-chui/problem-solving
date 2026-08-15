// https://leetcode.com/problems/longest-subsequence-with-non-zero-bitwise-xor

class Solution {
    func longestSubsequence(_ nums: [Int]) -> Int {
        let xor = nums.reduce(0, ^)
        if xor != 0 {
            return nums.count
        }
        return nums.contains { $0 != 0 } ? nums.count - 1 : 0
    }
}
