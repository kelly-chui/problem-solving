// https://leetcode.com/problems/longest-strictly-increasing-or-strictly-decreasing-subarray

class Solution {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        var increasing = 1
        var decreasing = 1
        var answer = 1

        for i in 1..<nums.count {
            increasing = nums[i] > nums[i - 1] ? increasing + 1 : 1
            decreasing = nums[i] < nums[i - 1] ? decreasing + 1 : 1
            answer = max(answer, increasing, decreasing)
        }

        return answer
    }
}
