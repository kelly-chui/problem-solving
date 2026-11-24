// https://leetcode.com/problems/maximum-subarray-with-equal-products

class Solution {
    func maxLength(_ nums: [Int]) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int {
            b == 0 ? a : gcd(b, a % b)
        }
        
        var answer = 2
        var start = 0
        var end = 0
        var prod = 1

        while end < nums.count {
            while gcd(prod, nums[end]) != 1 {
                prod /= nums[start]
                start += 1
            }
            prod *= nums[end]
            end += 1
            answer = max(answer, end - start)
        }

        return answer
    }
}
