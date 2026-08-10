// https://leetcode.com/problems/minimum-operations-to-make-a-uni-value-grid

class Solution {
    func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
        let flattenGrid = grid.flatMap { $0 }.sorted()
        let remainder = flattenGrid.first! % x
        guard flattenGrid.allSatisfy({ $0 % x == remainder}) else {
            return -1
        }
        let median = flattenGrid[flattenGrid.count / 2]
        return flattenGrid.map { abs($0 - median) / x }.reduce(0) { $0 + $1 }
    }
}
