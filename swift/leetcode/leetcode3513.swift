// https://leetcode.com/problems/number-of-unique-xor-triplets-i

class Solution {
    func uniqueXorTriplets(_ nums: [Int]) -> Int {
        let n = nums.count
        if n <= 2 {
            return n
        }
        let msb = 63 - n.leadingZeroBitCount
        return 1 << (msb + 1)
    }
}
