// https://leetcode.com/problems/valid-parentheses/

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        for c in s {
            if let open = pairs[c] {
                if stack.last == open {
                    stack.popLast()
                } else {
                    return false
                }
            } else {
                stack.append(c)
            }
        }
        return stack.isEmpty
    }
}
