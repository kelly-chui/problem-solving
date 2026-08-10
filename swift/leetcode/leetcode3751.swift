// https://leetcode.com/problems/total-waviness-of-numbers-in-range-i

class Solution {
    func totalWaviness(_ num1: Int, _ num2: Int) -> Int {
        var answer = 0
        for num in num1...num2 {
            let numArray = String(num).compactMap { Int(String($0)) }
            guard numArray.count > 2 else { continue }
            for idx in 1..<numArray.count - 1 {
                if numArray[idx] > numArray[idx - 1] && numArray[idx] > numArray[idx + 1] {
                    answer += 1
                } else if numArray[idx] < numArray[idx - 1] && numArray[idx] < numArray[idx + 1] {
                    answer += 1
                }
            }
        }
        return answer
    }
}
