// https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii

class Solution {
    func minimumPushes(_ word: String) -> Int {
        var frequencies = [Character: Int]()
        for char in word {
            frequencies[char, default: 0] += 1
        }
        
        return frequencies.values
            .sorted { $0 > $1 }
            .enumerated()
            .reduce(0) { $0 + ($1.offset / 8 + 1) * $1.element }
    }
}
