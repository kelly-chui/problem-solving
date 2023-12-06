import Foundation

struct Queue {
    var queue = [(Int, Int)]()
    var ptr = 0
    var isEmpty: Bool { ptr >= queue.count }
    
    mutating func push(_ v: (Int, Int)) {
        queue.append(v)
    }
    mutating func pop() -> (Int, Int) {
        let dequeuedElement = queue[ptr]
        ptr += 1
        if ptr > 500_000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return dequeuedElement
    }
}

func bfs1(_ root: (Int, Int), _ marker: Int) {
    var queue = Queue()
    queue.push(root)
    isVisited[root.0][root.1] = true
    board[root.0][root.1] = marker
    
    while !queue.isEmpty {
        let (row, column) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= n {
                continue
            }
            if isVisited[newRow][newColumn] || board[newRow][newColumn] == 0 {
                continue
            }
            isVisited[newRow][newColumn] = true
            board[newRow][newColumn] = marker
            queue.push((newRow, newColumn))
        }
    }
}

func bfs2(_ marker: Int) {
    var queue = Queue()
    var distances = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)

    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] == marker {
                queue.push((i, j))
                distances[i][j] = 0
            }
        }
    }

    while !queue.isEmpty {
        let (row, column) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= n {
                continue
            }
            if board[newRow][newColumn] > 0 && board[newRow][newColumn] != marker {
                answer = min(answer, distances[row][column])
                return
            }
            if board[newRow][newColumn] == 0 && distances[newRow][newColumn] == -1 {
                distances[newRow][newColumn] = distances[row][column] + 1
                queue.push((newRow, newColumn))
            }
        }
    }
}

let n = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var answer = 987_654_321
let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var marker = 1
for row in 0..<n {
    for column in 0..<n {
        if isVisited[row][column] || board[row][column] == 0 {
            continue
        }
        bfs1((row, column), marker)
        marker += 1
    }
}

for m in 1..<marker {
    bfs2(m)
}
print(answer)