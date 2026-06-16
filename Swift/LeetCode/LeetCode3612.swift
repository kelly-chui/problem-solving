// https://leetcode.com/problems/process-string-with-special-operations-i

class Solution {
    func processStr(_ s: String) -> String {
        var answer = ""
        for char in s {
            switch char {
            case "*":
                guard answer.count != 0 else { break }
                answer.popLast()
            case "#":
                answer += answer
            case "%":
                answer = String(answer.reversed())
            default:
                answer.append(char)
            }
        }
        return answer
    }
}
