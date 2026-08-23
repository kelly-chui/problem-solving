// https://leetcode.com/problems/check-divisibility-by-digit-sum-and-product

class Solution {
    func checkDivisibility(_ n: Int) -> Bool {
        let digits = String(n).compactMap { Int(String($0)) }
        let digitSum = digits.reduce(0) { $0 + $1 }
        let digitProduct = digits.reduce(1) { $0 * $1 }
        return n % (digitSum + digitProduct) == 0
    }
}
