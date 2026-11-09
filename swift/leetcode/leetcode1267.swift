// https://leetcode.com/problems/count-servers-that-communicate

class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid.first?.count ?? 0
        var rows = [Int](repeating: 0, count: m)
        var cols = [Int](repeating: 0, count: n)
        
        for row in 0..<m {
            for col in 0..<n {
                if grid[row][col] == 1 {
                    rows[row] += 1
                    cols[col] += 1
                }
            }
        }
        var answer = 0
        for row in 0..<m {
            for col in 0..<n {
                if grid[row][col] == 1 &&
                    (rows[row] > 1 || cols[col] > 1) {
                    answer += 1
                }
            }
        }

        return answer
    }
}
