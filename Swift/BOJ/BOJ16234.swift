import Foundation

func bfs(root: (Int, Int)) -> Bool {
    struct Queue {
        private var queue = [(Int, Int)]()
        private var ptr = 0
        var isEmpty: Bool {
            ptr >= queue.count
        }
        mutating func insert(v: (Int, Int)) {
            queue.append(v)
        }
        mutating func delete() -> (Int, Int) {
            let popped = queue[ptr]
            ptr += 1
            return popped
        }
    }
    let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var queue = Queue()
    var union: [(Int, Int)] = [root]
    var unionPop = graph[root.0][root.1]
    queue.insert(v: root)
    isVisited[root.0][root.1] = true
    while !queue.isEmpty {
        let node = queue.delete()
        for move in moves {
            let newNode = (node.0 + move.0, node.1 + move.1)
            if newNode.0 < 0 || newNode.0 >= n || newNode.1 < 0 || newNode.1 >= n { continue }
            if isVisited[newNode.0][newNode.1] { continue }
            let differ = abs(graph[node.0][node.1] - graph[newNode.0][newNode.1])
            if differ >= l && differ <= r {
                isVisited[newNode.0][newNode.1] = true
                queue.insert(v: newNode)
                union.append(newNode)
                unionPop += graph[newNode.0][newNode.1]
            }
        }
    }
    let dividedPop = unionPop / union.count
    for element in union {
        graph[element.0][element.1] = dividedPop
    }
    if union.count > 1 {
        return true
    } else {
        return false
    }
}

let nlr = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, l, r) = (nlr[0], nlr[1], nlr[2])
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var answer = 0

while true {
    var isEnd = true
    for row in 0..<n {
        for column in 0..<n {
            if !isVisited[row][column] && bfs(root: (row, column)){
                isEnd = false
            }
        }
    }
    if isEnd {
       break
    }
    isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    answer += 1
}
print(answer)
