// https://leetcode.com/problems/minimum-number-of-changes-to-make-binary-string-beautiful

class Solution {
    func minChanges(_ s: String) -> Int {
        var s = Array(s)
        var answer = 0
        for idx in stride(from: 0, to: s.count, by: 2) {
            if s[idx] != s[idx + 1] {
                answer += 1
            }
        }
        return answer
    }
}
