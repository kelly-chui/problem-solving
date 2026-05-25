// https://leetcode.com/problems/check-if-array-is-sorted-and-rotated

class Solution {
    func check(_ nums: [Int]) -> Bool {
        var count = 0
        let n = nums.count
        for i in 0..<n {
            if nums[i] > nums[(i + 1) % n] {
                count += 1
            }
        }
        return count <= 1
    }
}