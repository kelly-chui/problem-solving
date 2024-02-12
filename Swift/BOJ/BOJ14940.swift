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
        if ptr > 100_000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return firstValue
    }
}

func bfs(start: (Int, Int)) {
    let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var queue = Queue()
    isVisited[start.0][start.1] = 0
    queue.push(start)
    
    while !queue.isEmpty {
        let (row, column) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= m {
                continue
            }
            if isVisited[newRow][newColumn] != -1 {
                continue
            }
            if graph[newRow][newColumn] == 1 {
                queue.push((newRow, newColumn))
                isVisited[newRow][newColumn] = isVisited[row][column] + 1   
            }
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var isVisited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var graph = [[Int]]()
var start = (0, 0)
var isStartFound = false

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for row in 0..<n {
    for column in 0..<m {
        if graph[row][column] == 2 {
            start = (row, column)
            isStartFound = true
        } else if graph[row][column] == 0 {
            isVisited[row][column] = 0
        }
    }
}

bfs(start: start)

for row in isVisited {
    for idx in 0..<m {
        print(row[idx], terminator: idx == m - 1 ? "\n" : " ")
    }
}