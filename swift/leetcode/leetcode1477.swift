// https://leetcode.com/problems/find-two-non-overlapping-sub-arrays-each-with-target-sum

class Solution {
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        let n = arr.count
        var start = 0
        var sum = 0
        var startLength = [Int](repeating: Int.max, count: n)
        for end in 0..<n {
            sum += arr[end]
            while sum > target && start <= end {
                sum -= arr[start]
                start += 1
            }
            if sum == target {
                startLength[start] = end - start + 1
            }
        }
        var endLength = [Int](repeating: Int.max, count: n)
        for s in 0..<n where startLength[s] < Int.max {
            let e = s + startLength[s] - 1
            endLength[e] = startLength[s]
        }
        var pre = [Int](repeating: Int.max, count: n + 1)
        for i in 0..<n {
            pre[i + 1] = min(pre[i], endLength[i])
        }
        var suf = [Int](repeating: Int.max, count: n + 1)
        for i in stride(from: n - 1, through: 0, by: -1) {
            suf[i] = min(suf[i + 1], startLength[i])
        }
        var answer = Int.max
        for i in 0...n {
            if pre[i] < Int.max && suf[i] < Int.max {
                answer = min(answer, pre[i] + suf[i])
            }
        }
        return answer == Int.max ? -1 : answer
    }
}
