// https://leetcode.com/problems/number-of-closed-islands

class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        typealias Location = (row: Int, col: Int)
        
        func bfs(start: Location) -> Bool {
            var queue = [Location]()
            queue.append(start)
            isVisited[start.row][start.col] = true
            var isIsland = true
            
            while !queue.isEmpty {
                let (row, col) = queue.removeFirst()
                for (dr, dc) in [(0, -1), (1, 0), (0, 1), (-1, 0)] {
                    let newRow = row + dr
                    let newCol = col + dc
                    guard 0..<rowSize ~= newRow && 0..<colSize ~= newCol else {
                        isIsland = false
                        continue
                    }
                    guard grid[newRow][newCol] == 0 else {
                        continue
                    }
                    guard !isVisited[newRow][newCol] else {
                        continue
                    }
                    isVisited[newRow][newCol] = true
                    queue.append((newRow, newCol))
                }
            }
            return isIsland
        }

        let rowSize = grid.count
        let colSize = grid.first?.count ?? 0

        var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: colSize), count: rowSize)
        var answer = 0
        for row in grid.indices {
            for col in grid[row].indices {
                guard !isVisited[row][col] else {
                    continue
                }
                guard grid[row][col] == 0 else {
                    continue 
                }
                answer += (bfs(start: (row, col)) ? 1 : 0)
            }
        }
        return answer
    }
}
