// https://leetcode.com/problems/count-subarrays-with-majority-element-ii

class Solution {
    struct FenwickTree {
        private var tree: [Int]
        init(_ size: Int) {
            self.tree = Array(repeating: 0, count: size + 1)
        }
        mutating func add(_ index: Int, _ value: Int) {
            var i = index
            while i < tree.count {
                tree[i] += value
                i += i & -i
            }
        }
        func query(_ index: Int) -> Int {
            var i = index
            var result = 0
            while i > 0 {
                result += tree[i]
                i -= i & -i
            }
            return result
        }
    }
    func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
        var pSum = [0]
        for num in nums {
            pSum.append(pSum.last! + (num == target ? 1 : -1))
        }
        let n = nums.count
        let offset = n + 1
        let size = 2 * n + 3
        var bit = FenwickTree(size)
        var answer = 0
        for sum in pSum {
            let index = sum + offset
            answer += bit.query(index - 1)
            bit.add(index, 1)
        }
        return answer
    }
}
