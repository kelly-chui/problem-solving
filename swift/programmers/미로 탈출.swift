import Foundation

func solution(_ maps:[String]) -> Int {
    struct Queue {
        private var queue: [(Int, Int)] = []
        private var ptr = 0
        
        var isEmpty: Bool {
            ptr >= queue.count
        }
        
        mutating func insert(_ v: (Int, Int)) {
            queue.append(v)
        }
        
        mutating func delete() -> (Int, Int) {
            let pop = queue[ptr]
            ptr += 1
            if ptr > 5000 {
                queue = Array(queue[ptr...])
                ptr = 0
            }
            return pop
        }
    }
    
    func bfs(_ start: (Int, Int), _ target: (Int, Int)) -> Int {
        let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var isVisited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
        var queue = Queue()
        queue.insert(start)
        isVisited[start.0][start.1] = 0
        
        while !queue.isEmpty {
            let (row, column) = queue.delete()
            for move in moves {
                let (newRow, newColumn) = (row + move.0, column + move.1)
                if (newRow, newColumn) == target {
                    return isVisited[row][column] + 1
                }
                if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= m {
                    continue
                }
                if isVisited[newRow][newColumn] != -1 || arrayMaps[newRow][newColumn] == "X" {
                    continue
                }
                queue.insert((newRow, newColumn))
                isVisited[newRow][newColumn] = isVisited[row][column] + 1
            }
        }
        return -1
    }
    
    let arrayMaps = maps.map { Array($0).map { String($0) } }
    let (n, m) = (arrayMaps.count, arrayMaps.first!.count)
    var start = (0, 0)
    var lever = (0, 0)
    var exit = (0, 0)
    var answer = 0
    for row in 0..<n {
        for column in 0..<m {
            if arrayMaps[row][column] == "L" {
                lever = (row, column)
            } else if arrayMaps[row][column] == "E" {
                exit = (row, column)
            } else if arrayMaps[row][column] == "S" {
                start = (row, column)
            }
        }
    }
    
    let firstBFS = bfs(start, lever)
    guard firstBFS != -1 else { return -1 }
    let secondBFS = bfs(lever, exit)
    guard secondBFS != -1 else { return -1 }
    answer = firstBFS + secondBFS
    return answer
}

