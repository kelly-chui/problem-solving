import Foundation

struct Queue {
    var queue = [(Int, Int)]()
    var ptr = 0
    var isEmpty: Bool { ptr >= queue.count }
    mutating func push(_ v: (Int, Int)) {
        queue.append(v)
    }
    mutating func pop() -> (Int, Int) {
        let popped = queue[ptr]
        ptr += 1
        return popped
    }
}

func bfs(_ root: (Int, Int)) {
    let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var queue = Queue()
    var updateList = [(Int, Int)]()
    queue.push(root)
    isVisited[root.0][root.1] = true
    while !queue.isEmpty {
        let (row, column) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            if newRow < 0 || newRow >= height || newColumn < 0 || newColumn >= width {
                continue
            }
            if isVisited[newRow][newColumn] {
                continue
            } else {
                isVisited[newRow][newColumn] = true
            }
            if board[newRow][newColumn] == 0 {
                queue.push((newRow, newColumn))
            } else {
                updateList.append((newRow, newColumn))
            }
        }
    }
    for location in updateList {
        board[location.0][location.1] = 0
    }
    cheeseCellCount -= updateList.count
}

let hw = readLine()!.split(separator: " ").map { Int(String($0))! }
let (height, width) = (hw[0], hw[1])
var board = [[Int]]()
for _ in 0..<height {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var isVisited = [[Bool]]()
var cheeseCellCount = board.map{ $0.filter { $0 == 1 }.count }.reduce(0) { $0 + $1 }
var answer = (0, cheeseCellCount)

while cheeseCellCount != 0 {
    answer.0 += 1
    isVisited = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
    bfs((0, 0))
    if cheeseCellCount != 0 {
        answer.1 = cheeseCellCount
    }
}

print(answer.0)
print(answer.1)