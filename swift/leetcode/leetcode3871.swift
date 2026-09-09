// https://leetcode.com/problems/count-commas-in-range-ii

class Solution {
    func intPow(_ base: Int, _ exp: Int) -> Int {
        return Int(pow(Double(base), Double(exp)))
    }
    
    func countCommas(_ n: Int) -> Int {
        var exp = 3
        var answer = 0
        while n >= intPow(10, exp) {
            answer += (n - intPow(10, exp) + 1)
            exp += 3
        }
        return answer
    }
}
