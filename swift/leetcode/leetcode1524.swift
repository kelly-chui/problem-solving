// https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum

class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        let MOD = 1_000_000_007
        var evenCount = 1
        var oddCount = 0
        var prefixSum = 0
        var answer = 0

        for element in arr {
            prefixSum += element
            if prefixSum % 2 == 0 {
                answer += oddCount
                evenCount += 1
            } else {
                answer += evenCount
                oddCount += 1
            }
        }
        return answer % MOD
    }
}
