// https://leetcode.com/problems/find-the-safest-path-in-a-grid

class Solution {
    typealias Location = (row: Int, col: Int)
    struct Queue {
        var container = [Location]()
        var ptr = 0
        var isEmpty: Bool { container.count <= ptr }
        
        mutating func push(_ value: Location) {
            container.append(value)
        }
        mutating func pop() -> Location {
            let headValue = container[ptr]
            ptr += 1
            return headValue
        }
    }
    func bfs(
            starts: [Location],
            r: Int,
            c: Int,
            factors: [[Int]] = [],
            minSafeness: Int = 0
        ) -> [[Int]] {
        var queue = Queue()
        var visited = [[Int]](repeating: [Int](repeating: -1, count: c), count: r)
        for start in starts {
            queue.push(start)
            visited[start.row][start.col] = 0
        }
        let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]

        while !queue.isEmpty {
            let (row, col) = queue.pop()
            for (dr, dc) in moves {
                let (nr, nc) = (row + dr, col + dc)
                guard 0..<r ~= nr && 0..<c ~= nc else { continue }
                guard visited[nr][nc] == -1 else { continue }
                guard factors.isEmpty || factors[nr][nc] >= minSafeness else { continue }
                visited[nr][nc] = visited[row][col] + 1
                queue.push((nr, nc))
            }
        }
        return visited
    }
    func upperBound(factors: [[Int]], r: Int, c: Int) -> Int {
        func canReach(_ minSafeness: Int) -> Bool {
            guard factors[0][0] >= minSafeness && factors[r-1][c-1] >= minSafeness else { return false }
            let visited = bfs(
                starts: [(0, 0)],
                r: r,
                c: c,
                factors: factors,
                minSafeness: minSafeness
            )
            return visited[r - 1][c - 1] != -1
        }
        var start = 0
        var end = r + c + 1
        while start < end {
            let mid = (start + end) / 2
            if canReach(mid) {
                start = mid + 1
            } else {
                end = mid
            }
        }
        return start - 1
    }
    func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
        let (r, c) = (grid.count, grid.first!.count)
        var thieves = [Location]()
        for row in grid.indices {
            for col in grid[row].indices {
                if grid[row][col] == 1 {
                    thieves.append((row, col))
                }
            }
        }
        let factors = bfs(starts: thieves, r: r, c: c)
        return upperBound(factors: factors, r: r, c: c)
    }
}
