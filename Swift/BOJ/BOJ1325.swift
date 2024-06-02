struct Queue {
    var queue = [Int]()
    var ptr = 0
    var isEmpty: Bool {
        ptr >= queue.count
    }
    mutating func push(_ v: Int) {
        queue.append(v)
    }
    mutating func pop() -> Int {
        let firstValue = queue[ptr]
        ptr += 1
        if ptr > 50000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return firstValue
    }
}

func bfs(_ start: Int) -> Int {
    var queue = Queue()
    var isVisited = [Bool](repeating: false, count: n + 1)
    queue.push(start)
    isVisited[start] = true
    var linkCount = 0

    while !queue.isEmpty {
        let current = queue.pop()
        for next in graph[current, default: []] {
            if isVisited[next] {
                continue
            }
            isVisited[next] = true
            linkCount += 1
            queue.push(next)
        }
    }
    return linkCount
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph: [Int: [Int]] = [:]

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    graph[b, default: []].append(a)
}

var answer = [Int]()
var maxCount = 0

for root in 1...n {
    let count = bfs(root)
    if maxCount < count {
        maxCount = count
        answer = [root]
    } else if maxCount == count {
        answer.append(root)
    }
}

for idx in 0..<answer.count {
    print(answer[idx], terminator: idx == answer.count - 1 ? "\n" : " ")
}
