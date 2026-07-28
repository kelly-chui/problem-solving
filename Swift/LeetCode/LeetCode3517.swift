// https://leetcode.com/problems/smallest-palindromic-rearrangement-i

class Solution {
    func smallestPalindrome(_ s: String) -> String {
        var countTable = [Character: Int]()
        var half = ""
        var center = ""
        for element in s {
            countTable[element, default: 0] += 1
        }
        for (element, count) in countTable.sorted(by: { $0.key < $1.key }) {
            if count % 2 == 1 {
                center = String(element)
            }
            half += String(repeating: element, count: count / 2)
        }
        return half + center + String(half.reversed())
    }
}
