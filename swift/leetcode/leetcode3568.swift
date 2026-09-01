// https://leetcode.com/problems/minimum-moves-to-clean-the-classroom

class Solution {
    typealias QueueElement = (x: Int, y: Int, mask: Int, e: Int, steps: Int)
    typealias Location = (row: Int, col: Int)
    func minMoves(_ classroom: [String], _ energy: Int) -> Int {
        let m = classroom.count
        let n = classroom.first!.count
        let graph = classroom.map { Array($0) }
        var litters = [Location]()
        var start: Location = (-1, -1)
        for row in 0..<m {
            for col in 0..<n {
                if graph[row][col] == "L" {
                    litters.append((row, col))
                } else if graph[row][col] == "S" {
                    start = (row, col)
                }
            }
        }
        var litterIdx = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
        for (idx, value) in litters.enumerated() {
            litterIdx[value.row][value.col] = idx
        }
        
        struct Queue {
            var container = [QueueElement]()
            var ptr = 0
            var isEmpty: Bool { ptr >= container.count }

            mutating func push(_ v: QueueElement) {
                container.append(v)
            }
            mutating func pop() -> QueueElement {
                let head = container[ptr]
                ptr += 1
                return head
            }
        }

        func bfs(start: Location) -> Int {
            var queue = Queue()
            queue.push((start.row, start.col, 0, energy, 0))
            let fullMask = (1 << litters.count) - 1

            var bestEnergy = [[[Int]]](
                repeating: [[Int]](
                    repeating: [Int](repeating: -1, count: fullMask + 1),
                    count: n
                ),
                count: m
            )
            bestEnergy[start.row][start.col][0] = energy
            
            while !queue.isEmpty {
                let current = queue.pop()
                if current.mask == fullMask {
                    return current.steps
                }
                for (dr, dc) in [(-1,0),(1,0),(0,-1),(0,1)] {
                    let newRow = current.x + dr
                    let newCol = current.y + dc
                    var newE = current.e - 1
                    var newMask = current.mask
                    guard newRow >= 0, newRow < m,
                          newCol >= 0, newCol < n,
                          graph[newRow][newCol] != "X",
                          newE >= 0 else { 
                        continue 
                    }
                    if graph[newRow][newCol] == "L" {
                        let idx = litterIdx[newRow][newCol]
                        newMask = current.mask | (1 << idx)
                    }
                    if graph[newRow][newCol] == "R" {
                        newE = energy
                    }
                    if newE <= bestEnergy[newRow][newCol][newMask] {
                        continue
                    }
                    bestEnergy[newRow][newCol][newMask] = newE
                    queue.push((newRow, newCol, newMask, newE, current.steps + 1))
                }
            }
            return -1
        }
        return bfs(start: start)
    }
}
