// https://leetcode.com/problems/minimum-operations-to-sort-a-string

class Solution {
    func minOperations(_ s: String) -> Int {
        let sortedS = String(s.sorted { $0 < $1 })
        let mn = s.min()
        let mx = s.max()
        if sortedS == s { return 0 }
        if s.count == 2 && sortedS != s { return -1 } 
        if s.first == mn || s.last == mx { return 1 }
        let ifMNInPrefix = s.dropLast().contains(mn!)
        let ifMXInSuffix = s.dropFirst().contains(mx!)
        if !ifMNInPrefix && !ifMXInSuffix { return 3 }
        return 2
    }
}
