// https://leetcode.com/problems/sum-of-gcd-of-formed-pairs

class Solution {
    func gcdSum(_ nums: [Int]) -> Int {        
        func gcd(a: Int, b: Int) -> Int {
            var a = a
            var b = b
            while b != 0 {
                (a, b) = (b, a % b)
            }
            return a
        }
        var currentMax = 0
        var prefixGcd = nums.indices.map { idx in
            currentMax = max(currentMax, nums[idx])
            return gcd(a: nums[idx], b: currentMax)
        }
        prefixGcd.sort { $0 < $1 }
        var answer = 0
        var right = prefixGcd.count - 1
        var left = 0
        while right > left {
            answer += gcd(a: prefixGcd[right], b: prefixGcd[left])
            right -= 1
            left += 1
        }
        return answer
    }
}
