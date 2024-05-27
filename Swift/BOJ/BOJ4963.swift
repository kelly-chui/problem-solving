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
}

func bfs(_ root: (Int, Int), _ h: Int, _ w: Int, _ graph: inout [[Int]], _ isVisited: inout [[Bool]]) {
    let moves = [(-1, 0), (0, 1), (1, 0), (0, -1), (-1, -1), (-1, 1), (1, 1), (1, -1)]
    var queue = Queue()
    queue.push(root)
    isVisited[root.0][root.1] = true

    while !queue.isEmpty {
        let cur = queue.pop()
        for move in moves {
            let next = (cur.0 + move.0, cur.1 + move.1)
            if next.0 < 0 || next.0 >= h || next.1 < 0 || next.1 >= w {
                continue
            }
            if isVisited[next.0][next.1] {
                continue
            }
            if graph[next.0][next.1] == 0 {
                continue
            }
            queue.push(next)
            isVisited[next.0][next.1] = true
        }
    }
}

while true {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let (w, h) = (wh[0], wh[1])
    if (w, h) == (0, 0) { exit(0) }
    var graph = [[Int]]()
    for _ in 0..<h {
        graph.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    var answer = 0
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    for row in 0..<h {
        for column in 0..<w {
            if graph[row][column] == 1 && !isVisited[row][column]{
                bfs((row, column), h, w, &graph, &isVisited)
                answer += 1
            }
        }
    }
    print(answer)
}
