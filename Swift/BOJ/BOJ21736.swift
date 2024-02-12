struct Queue {
    var queue = [(Int, Int)]()
    var ptr = 0
    var isEmpty: Bool {
        return ptr >= queue.count
    }

    mutating func push(_ value: (Int, Int)) {
        queue.append(value)
    }

    mutating func pop() -> (Int, Int) {
        let firstValue = queue[ptr]
        ptr += 1
        return firstValue
    }
}

func bfs(_ start: (Int, Int)) {
    let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var queue = Queue()
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    queue.push(start)
    isVisited[start.0][start.1] = true

    while !queue.isEmpty {
        let (row, column) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= m {
                continue
            }
            if isVisited[newRow][newColumn] || campus[newRow][newColumn] == "X" {
                continue
            }
            queue.push((newRow, newColumn))
            isVisited[newRow][newColumn] = true
            if campus[newRow][newColumn] == "P" {
                answer += 1
            }
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var campus = [[Character]]()
var isStartFound = false
var start = (0, 0)
var answer = 0

for _ in 0..<n {
    campus.append(Array(readLine()!))
}

for row in 0..<n where !isStartFound {
    for column in 0..<m where !isStartFound {
        if campus[row][column] == "I" {
            start = (row, column)
            isStartFound = true
        }
    }
}

bfs(start)

print(answer > 0 ? answer : "TT")