// https://leetcode.com/problems/minimum-operations-to-sort-a-permutation

class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        let reversedNums = Array(nums.reversed())
        let doubledNums = nums + nums
        var answer = Int.max
        for (idx, value) in doubledNums.enumerated() {
            guard value == 0 else { continue }
            guard idx < n else { break }
            if (idx + 1..<idx + n).allSatisfy({
                doubledNums[$0] == doubledNums[$0 - 1] + 1
            }) {
                answer = min(answer, idx, n - idx + 2)
            }
        }

        let reversedDoubledNums = reversedNums + reversedNums
        for (idx, value) in reversedDoubledNums.enumerated() {
            guard value == 0 else { continue }
            guard idx < n else { break }
            if (idx + 1..<idx + n).allSatisfy({
                reversedDoubledNums[$0] == reversedDoubledNums[$0 - 1] + 1
            }) {
                answer = min(answer, idx + 1, n - idx + 1)
            }
        }
        return answer == Int.max ? -1 : answer
    }
}
