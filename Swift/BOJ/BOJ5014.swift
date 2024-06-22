struct Queue {
    var queue = [Int]()
    var ptr = 0
    var isEmpty: Bool { ptr >= queue.count }
    mutating func push(_ v: Int) {
        queue.append(v)
    }
    mutating func pop() -> Int {
        let firstElement = queue[ptr]
        ptr += 1
        if ptr > 100_000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return firstElement
    }
}

func bfs(_ root: Int) -> String {
    var queue = Queue()
    queue.push(root)
    var isVisited = [Int](repeating: -1, count: f + 1)
    isVisited[root] = 0

    while !queue.isEmpty {
        let cur = queue.pop()
        for move in [u, -1 * d] {
            let next = cur + move
            if next < 1 || next > f {
                continue
            }
            if isVisited[next] != -1 {
                continue
            }
            isVisited[next] = isVisited[cur] + 1
            queue.push(next)
        }
    }
    if isVisited[g] != -1 {
        return String(isVisited[g])
    } else {
        return "use the stairs"
    }
}

let fsgud = readLine()!.split(separator: " ").map { Int($0)! }
let (f, s, g, u, d) = (fsgud[0], fsgud[1], fsgud[2], fsgud[3], fsgud[4])
print(bfs(s))