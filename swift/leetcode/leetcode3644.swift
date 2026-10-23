// https://leetcode.com/problems/maximum-k-to-sort-a-permutation

class Solution {
    func sortPermutation(_ nums: [Int]) -> Int {
        let n = nums.count
        let sortedNums = nums.sorted { $0 < $1 }
        if sortedNums == nums { return 0 }
        var mispositioned = [Int]()
        for idx in 0..<n {
            if nums[idx] != sortedNums[idx] {
                mispositioned.append(nums[idx])
            }
        }
        return mispositioned.reduce(-1) { $0 & $1 }
    }
}
