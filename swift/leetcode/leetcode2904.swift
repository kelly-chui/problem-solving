// https://leetcode.com/problems/shortest-and-lexicographically-smallest-beautiful-string

class Solution {
    func shortestBeautifulSubstring(_ s: String, _ k: Int) -> String {
        let chars = Array(s)
        var answer = ""
        var start = 0
        var oneCount = 0

        for end in chars.indices {
            if chars[end] == "1" {
                oneCount += 1
            }
            while oneCount > k {
                if chars[start] == "1" {
                    oneCount -= 1
                }
                start += 1
            }
            while oneCount == k && chars[start] == "0" {
                start += 1
            }
            if oneCount == k {
                let candidate = String(chars[start...end])
                if answer.isEmpty ||
                    candidate.count < answer.count ||
                    (candidate.count == answer.count && candidate < answer) {
                    answer = candidate
                }
            }
        }
        return answer
    }
}
