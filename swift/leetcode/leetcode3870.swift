// https://leetcode.com/problems/count-commas-in-range

class Solution {
    func countCommas(_ n: Int) -> Int {
        var answer = 0
        if n >= 1000 {
            answer += (n - 1000 + 1) * 1
        }
        return answer
    }
}
