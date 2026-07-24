// https://leetcode.com/problems/number-of-unique-xor-triplets-ii

class Solution {
    func uniqueXorTriplets(_ nums: [Int]) -> Int {
        let distinctValues = Set(nums)
        var result = distinctValues
        var pairXORs = Set<Int>()
        let valuesArray = Array(distinctValues)
        for i in 0..<valuesArray.count {
            for j in i..<valuesArray.count {
                pairXORs.insert(valuesArray[i] ^ valuesArray[j])
            }
        }
        for p in pairXORs {
            for v in distinctValues {
                result.insert(p ^ v)
            }
        }
        return result.count
    }
}
