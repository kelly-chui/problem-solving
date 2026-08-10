// https://leetcode.com/problems/jump-game-ix

class Solution {
    func maxValue(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var minTable = nums
        var maxTable = nums
        var answer = [Int](repeating: 0, count: n)
        for i in 1..<n {
            maxTable[i] = max(maxTable[i - 1], nums[i])
            minTable[n - 1 - i] = min(minTable[n - i], nums[n - 1 - i])
        }
        var componentStart = 0
        for i in 0..<n {
            if i == n - 1 || maxTable[i] <= minTable[i + 1] {
                for j in componentStart...i {
                    answer[j] = maxTable[i]
                }
                componentStart = i + 1
            }
        }
        return answer
    }
}
