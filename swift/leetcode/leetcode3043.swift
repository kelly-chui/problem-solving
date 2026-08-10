// https://leetcode.com/problems/find-the-length-of-the-longest-common-prefix

class Solution {
    func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var answer = 0
        var preSet = Set<Int>()
        arr1.forEach { element in 
            var current = element
            while current > 0 {
                preSet.insert(current)
                current /= 10
            }
        }
        arr2.forEach { element in 
            var current = element
            while current > 0 {
                if preSet.contains(current) && answer < String(current).count {
                    answer = String(current).count
                    break
                }
                current /= 10
            }
        }
        return answer
    }
}
