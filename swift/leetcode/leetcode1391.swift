class Solution {
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        struct Queue {
            private var container = [(Int, Int)]()
            private var ptr = 0
            var isEmpty: Bool {
                ptr >= container.count
            }
            mutating func push(_ val: (Int, Int)) {
                container.append(val)
            }
            mutating func pop() -> (Int, Int) {
                let frontValue = container[ptr]
                ptr += 1
                if ptr > 100000 {
                    container = Array(container[ptr...])
                    ptr = 0
                }
                return frontValue
            }
        }
        
        func bfs() -> Bool {
            var queue = Queue()
            queue.push((0, 0))
            var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
            isVisited[0][0] = true
            let directions = [
                1: [(0, -1), (0, 1)],
                2: [(-1, 0), (1, 0)],
                3: [(0, -1), (1, 0)],
                4: [(0, 1), (1, 0)],
                5: [(0, -1), (-1, 0)],
                6: [(0, 1), (-1, 0)]
            ]
            while !queue.isEmpty {
                let (row, col) = queue.pop()
                for direction in directions[grid[row][col]]! {
                    let (newRow, newCol) = (row + direction.0, col + direction.1)
                    guard 0..<m ~= newRow && 0..<n ~= newCol else { continue }
                    guard !isVisited[newRow][newCol] else { continue }
                    let reverse = (-direction.0, -direction.1)
                    guard directions[grid[newRow][newCol]]!.contains(where: {
                        $0.0 == reverse.0 && $0.1 == reverse.1
                    }) else {
                        continue
                    }
                    if newRow == m - 1 && newCol == n - 1 { return true }
                    isVisited[newRow][newCol] = true
                    queue.push((newRow, newCol))
                }
            }
            return false
        }
        let m = grid.count
        let n = grid.first?.count ?? 0
        guard m != 1 || n != 1 else { return true }
        return bfs()
    }
}
