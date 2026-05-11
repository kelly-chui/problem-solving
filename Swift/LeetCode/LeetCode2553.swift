// https://leetcode.com/problems/separate-the-digits-in-an-array

class Solution {
    func separateDigits(_ nums: [Int]) -> [Int] {
        return nums.flatMap { String($0).compactMap { Int(String($0)) }}
    }
}