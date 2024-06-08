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
        let firstElement = queue[ptr]
        ptr += 1
        return firstElement
    }
}

func bfs(_ root: (Int, Int)) -> Int {
    let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    var queue = Queue()
    var isVisited = [[Int]](repeating: [Int](repeating: -1, count: c), count: r)
    var maxDistance = 0
    queue.push(root)
    isVisited[root.0][root.1] = 0

    while !queue.isEmpty {
        let cur = queue.pop()
        for move in moves {
            let next = (cur.0 + move.0, cur.1 + move.1)
            if next.0 < 0 || next.0 >= r || next.1 < 0 || next.1 >= c {
                continue
            }
            if isVisited[next.0][next.1] != -1 {
                continue
            }
            if graph[next.0][next.1] == "W" {
                continue
            }
            isVisited[next.0][next.1] = isVisited[cur.0][cur.1] + 1
            maxDistance = max(isVisited[next.0][next.1], maxDistance)
            queue.push(next)
        }
    }
    return maxDistance
}

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])
var graph = [[Character]]()
for _ in 0..<r {
    graph.append(Array(readLine()!))
}
var answer = 0

for row in 0..<r {
    for column in 0..<c {
        if graph[row][column] == "L" {
            answer = max(bfs((row, column)), answer)
        }
    }
}

print(answer)