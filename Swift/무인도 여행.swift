import Foundation

func solution(_ maps:[String]) -> [Int] {
    struct Queue {
        var queue: [(Int, Int)] = []
        var ptr = 0
        
        func isEmpty() -> Bool {
            return ptr >= queue.count
        }
        
        mutating func push(_ v: (Int, Int)) {
            queue.append(v)
        }
        
        mutating func pop() -> (Int, Int) {
            let popped = queue[ptr]
            ptr += 1
            if ptr > 5000 {
                queue = Array(queue[ptr...])
                ptr = 0
            }
            return popped
        }
    }
    
    func bfs(_ root: (Int, Int)) -> Int {
        var queue = Queue()
        var sum = Int(graph[root.0][root.1])!
        let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        isVisited[root.0][root.1] = true
        queue.push(root)
        while !queue.isEmpty() {
            let (x, y) = queue.pop()
            for move in moves {
                let (newX, newY) = (x + move.0, y + move.1)
                if newX < 0 || newX >= n || newY < 0 || newY >= m {
                    continue
                }
                if isVisited[newX][newY] || graph[newX][newY] == "X" {
                    continue
                }
                sum += Int(graph[newX][newY])!
                isVisited[newX][newY] = true
                queue.push((newX, newY))
            }
        }
        return sum
    }
    
    let (n, m) = (maps.count, maps[0].count)
    
    let graph = maps.map { Array($0).map { String($0) } }
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var answer: [Int] = []
    
    for row in 0..<n {
        for column in 0..<m {
            if isVisited[row][column] || graph[row][column] == "X" {
                continue
            } else {
                answer.append(bfs((row, column)))
            }
        }
    }
    answer.sort { $0 < $1 }

    return answer.count == 0 ? [-1] : answer
}
