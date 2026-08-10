// https://leetcode.com/problems/find-a-safe-walk-through-a-grid

class Solution {
    typealias Location = (row: Int, col: Int)
    func findSafeWalk(_ grid: [[Int]], _ health: Int) -> Bool {
        let (m, n) = (grid.count, grid.first!.count)
        func bfs(start: Location) -> Int {
            var queue = [Location]()
            var visited = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
            queue.append(start)
            visited[start.row][start.col] = grid[start.row][start.col]
            while !queue.isEmpty {
                let (row, col) = queue.removeFirst()
                for (dr, dc) in [(-1, 0), (0, 1), (1, 0), (0, -1)] {
                    let (newRow, newCol) = (row + dr, col + dc)
                    guard 0..<m ~= newRow && 0..<n ~= newCol else { continue }
                    guard visited[newRow][newCol] == -1 else { continue }
                    if grid[newRow][newCol] == 0 {
                        visited[newRow][newCol] = visited[row][col]
                        queue.insert((newRow, newCol), at: 0)
                    } else if grid[newRow][newCol] == 1 {
                        visited[newRow][newCol] = visited[row][col] + 1
                        queue.append((newRow, newCol))
                    }
                }
            }
            return visited[m - 1][n - 1]
        }
        return health > bfs(start: (0, 0))
    }
}
