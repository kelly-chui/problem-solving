// https://leetcode.com/problems/find-greatest-common-divisor-of-array

class Solution {
    func findGCD(_ nums: [Int]) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int { 
            b == 0 ? a : gcd(b, a % b)
        }
        var min = Int.max
        var max = 0
        for num in nums {
            min = min > num ? num : min
            max = max < num ? num : max
        }
        return gcd(min, max)
    }
}
