import Foundation

struct Queue {
    var queue = [(Int, Int)]()
    var ptr = 0
    var isEmpty: Bool {
        ptr >= queue.count
    }
    mutating func push(_ v: (Int, Int)) {
        queue.append(v)
    }
    mutating func pop() -> (Int, Int) {
        let firstValue = queue[ptr]
        ptr += 1
        return firstValue
    }
    mutating func clear() {
        queue = []
    }
}

func bfs(_ start: (Int, Int), _ dest: (Int, Int), _ l: Int) -> Int {
    let moves = [(-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1)]
    var queue = Queue()
    var isVisited = [[Int]](repeating: [Int](repeating: -1, count: l), count: l)
    queue.push(start)
    isVisited[start.0][start.1] = 0
    var answer = 0
    while !queue.isEmpty {
        let current = queue.pop()
        for move in moves {
            let next = (current.0 + move.0, current.1 + move.1)
            if next.0 < 0 || next.0 >= l || next.1 < 0 || next.1 >= l  {
                continue
            }
            if isVisited[next.0][next.1] != -1 {
                continue
            }
            queue.push(next)
            isVisited[next.0][next.1] = isVisited[current.0][current.1] + 1
            if next == dest {
                answer = isVisited[next.0][next.1]
                queue.clear()
                break
            }
        }
    }
    return answer
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let l = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let (startRow, startColumn) = (start[0], start[1])
    let destination = readLine()!.split(separator: " ").map { Int($0)! }
    let (destRow, destColumn) = (destination[0], destination[1])
    print(bfs((startRow, startColumn), (destRow, destColumn), l))
}