// https://leetcode.com/problems/process-string-with-special-operations-ii

class Solution {
    func processStr(_ s: String, _ k: Int) -> Character {
        let chars = Array(s)
        var lengths: [Int] = []
        var length = 0
        for char in chars {
            switch char {
            case "*":
                if length > 0 {
                    length -= 1
                }
            case "#":
                length *= 2
            case "%":
                break
            default:
                length += 1
            }
            lengths.append(length)
        }
        guard k < length else {
            return "."
        }
        var idx = k
        for (i, char) in chars.enumerated().reversed() {
            let beforeLength = i == 0 ? 0 : lengths[i - 1]
            let afterLength = lengths[i]
            switch char {
            case "#":
                idx %= beforeLength
            case "%":
                idx = afterLength - 1 - idx
            case "*":
                break
            default:
                if idx == afterLength - 1 && afterLength == beforeLength + 1 {
                    return char
                }
            }
        }
        return "."
    }
}
