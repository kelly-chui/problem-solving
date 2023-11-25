import Foundation

struct Queue {
    private var queue = [Int]()
    private var ptr = 0
    var isEmpty: Bool {
        ptr >= queue.count
    }
    mutating func push(v: Int) {
        queue.append(v)
    }
    mutating func pop() -> Int {
        let popped = queue[ptr]
        ptr += 1
        if ptr > 50_000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return popped
    }
}

func bfs(root: Int, weight: Int) -> Bool {
    var isVisited = [Bool](repeating: false, count: n + 1)
    var queue = Queue()
    queue.push(v: root)
    isVisited[root] = true
    while !queue.isEmpty {
        let island = queue.pop()
        for nextIsland in graphs[island]! {
            if isVisited[nextIsland.0] { continue }
            if nextIsland.1 < weight { continue }
            isVisited[nextIsland.0] = true
            if nextIsland.0 == factories[1] {
                return true
            }
            queue.push(v: nextIsland.0)
        }
    }
    return false
}

func binarySearch() -> Int {
    var low = 1
    var high = 1_000_000_000
    var mid = 0
    while low <= high {
        mid = (low + high) / 2
        if bfs(root: factories[0], weight: mid) {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return high
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graphs: [Int: [(Int, Int)]] = [:]
for _ in 0..<m {
    let bridge = readLine()!.split(separator: " ").map { Int(String($0))! }
    graphs[bridge[0], default: []].append((bridge[1], bridge[2]))
    graphs[bridge[1], default: []].append((bridge[0], bridge[2]))
}
let factories = readLine()!.split(separator: " ").map { Int(String($0))! }
print(binarySearch())
