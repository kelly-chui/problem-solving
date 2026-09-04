// https://leetcode.com/problems/smallest-stable-index-i

class Solution {
    func firstStableIndex(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var prefixMax = [Int](repeating: 0, count: n)
        var suffixMin = [Int](repeating: Int.max, count: n)
        prefixMax[0] = nums.first!
        suffixMin[n - 1] = nums.last!
        for idx in 1..<n {
            prefixMax[idx] = max(prefixMax[idx - 1], nums[idx])
            suffixMin[n - idx - 1] = min(suffixMin[n - idx], nums[n - idx - 1])
        }
        var answer = -1
        for idx in 0..<n {
            let instabilityScore = prefixMax[idx] - suffixMin[idx]
            if instabilityScore <= k { 
                answer = idx
                break 
            }
        }
        return answer
    }
}
