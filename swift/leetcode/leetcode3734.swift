// https://leetcode.com/problems/lexicographically-smallest-palindromic-permutation-greater-than-target

class Solution {
    func lexPalindromicPermutation(_ s: String, _ target: String) -> String {
        let intToChar = Array("abcdefghijklmnopqrstuvwxyz")
        let charToInt = [Character: Int](uniqueKeysWithValues: zip("abcdefghijklmnopqrstuvwxyz", 0...25))
        let n = s.count
        var frequencies = [Int](repeating: 0, count: 26)
        s.forEach { frequencies[charToInt[$0]!] += 1 }
        var oddCharCount = frequencies.filter { $0 % 2 == 1}.count
        if oddCharCount >= 2 { return "" }
        if oddCharCount == 1 && n % 2 == 0 { return "" }
        let midChar = frequencies.firstIndex(where: { $0 % 2 != 0 }).map { intToChar[$0] }
        var left = [Character]()
        var freq = frequencies
        let arrayTarget = Array(target)

        func backtrack(_ idx: Int, _ isGreater: Bool) -> Bool {
            if idx == n / 2 {
                if isGreater { return true }
                let right = (midChar.map { [$0] } ?? []) + left.reversed()
                let targetRight = Array(arrayTarget[(n / 2)...])
                return !right.lexicographicallyPrecedes(targetRight) && right != targetRight
            }
            let targetCharIdx = charToInt[arrayTarget[idx]]!
            let startIdx = isGreater ? 0 : targetCharIdx
            for c in startIdx..<26 {
                guard freq[c] >= 2 else { continue }
                left.append(intToChar[c])
                freq[c] -= 2
                if backtrack(idx + 1, isGreater || c > targetCharIdx) {
                    return true
                }
                left.removeLast()
                freq[c] += 2
            }
            return false
        }

        if !backtrack(0, false) { return "" }
        let mid: [Character] = midChar.map { [$0] } ?? []
        return String(left + mid + left.reversed())
    }
}
