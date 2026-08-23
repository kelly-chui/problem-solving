// https://leetcode.com/problems/sum-game

class Solution {
    func sumGame(_ num: String) -> Bool {
        let mid = num.count / 2
        let left = Array(num.prefix(mid))
        let right = Array(num.suffix(mid))
        let leftQmarkCount = left.filter { $0 == "?" }.count
        let rightQmarkCount = right.filter { $0 == "?" }.count
        if (leftQmarkCount + rightQmarkCount) % 2 == 1 {
            return true
        }
        let leftSum = left.compactMap { Int(String($0)) }.reduce(0) { $0 + $1 }
        let rightSum = right.compactMap { Int(String($0)) }.reduce(0) { $0 + $1 }
        let diff = leftSum - rightSum
        let balance = 2 * diff + 9 * (leftQmarkCount - rightQmarkCount)
        return balance != 0
    }
}
