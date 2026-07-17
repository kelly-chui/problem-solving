// https://leetcode.com/problems/sorted-gcd-pair-queries

class Solution {
    func gcdValues(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let maxNum = nums.max() ?? 0
        var numCount = [Int](repeating: 0, count: maxNum + 1)
        for num in nums {
            numCount[num] += 1
        }
        var gCount = [Int](repeating: 0, count: maxNum + 1)
        for g in 1...maxNum {
            for m in stride(from: g, through: maxNum, by: g) {
                gCount[g] += numCount[m]
            }
        }
        var exact = [Int](repeating: 0, count: maxNum + 1)
        for g in stride(from: maxNum, to: 0, by: -1) {
            let pairs = gCount[g] * (gCount[g] - 1) / 2
            exact[g] = pairs
            for m in stride(from: 2 * g, through: maxNum, by: g) {
                exact[g] -= exact[m]
            }
        }
        var prefixSum = [Int](repeating: 0, count: maxNum + 2)
        for g in 1...maxNum {
            prefixSum[g] = prefixSum[g - 1] + exact[g]
        }
        var answer = [Int]()
        for q in queries {
            var lo = 1, hi = maxNum
            while lo < hi {
                let mid = (lo + hi) / 2
                if prefixSum[mid] <= q {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            answer.append(lo)
        }
        return answer
    }
}
