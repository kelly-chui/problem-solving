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
    islandMap[root.0][root.1] = marker
    queue.push(root)
    isVisited[root.0][root.1] = true
    
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
            queue.push((newRow, newColumn))
            islandMap[newRow][newColumn] = marker
        }
    }
}

func bfs2(_ root: (Int, Int), _ marker: Int) {
    var queue = Queue()
    queue.push(root)
    isVisited[root.0][root.1] = true
    
    while !queue.isEmpty {
        let (row, column) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= n {
                continue
            }
            if isVisited[newRow][newColumn] {
                continue
            }
            if board[newRow][newColumn] == 0 {
                isVisited[newRow][newColumn] = true
                queue.push((newRow, newColumn))
                board[newRow][newColumn] = board[row][column] + 1
            }
            if board[newRow][newColumn] == 1 && islandMap[newRow][newColumn] == marker {
                isVisited[newRow][newColumn] = true
                queue.push((newRow, newColumn))
            }
            if board[newRow][newColumn] == 1 && islandMap[newRow][newColumn] != marker {
                answer = min(answer, board[row][column])
            }
        }
    }
}

let n = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var newBoard = board
var islandMap = board
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var marker = 1
var representLocation = [Int: (Int, Int)]()
var answer = 987_654_321
let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for row in 0..<n {
    for column in 0..<n {
        if isVisited[row][column] || board[row][column] == 0 {
            continue
        }
        bfs1((row, column), marker)
        marker += 1
        representLocation[marker] = (row, column)
    }
}

isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for (marker, location) in representLocation {
    bfs2(location, marker)
    board = newBoard
}


board.forEach { print($0) }
print()
newBoard.forEach { print($0) }
print()
islandMap.forEach { print($0) }

print(answer)