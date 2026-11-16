// https://leetcode.com/problems/calculate-digit-sum-of-a-string

class Solution {
    func digitSum(_ s: String, _ k: Int) -> String {
        var s = Array(s)
        while s.count > k {
            let groups = stride(from: 0, to: s.count, by: k).map {
                Array(s[$0..<min($0 + k, s.count)])
            }
            s = Array(
                groups.map {
                    String($0.reduce(0) { $0 + Int(String($1))! })
                }.joined()
            )
        }
        return String(s)
    }
}
