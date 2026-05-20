// https://leetcode.com/problems/find-the-prefix-common-array-of-two-arrays

class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        let n = A.count
        var answer = [Int]()
        var count = [Int](repeating: 0, count: n + 1)
        var common = 0
        for i in 0..<n {
            let (a, b) = (A[i], B[i])
            count[a] += 1
            if count[a] == 2 {
                common += 1
            }
            count[b] += 1
            
            if count[b] == 2 {
                common += 1
            }
            answer.append(common)
        }
        return answer
    }
}
