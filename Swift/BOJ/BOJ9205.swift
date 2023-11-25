import Foundation

func distance(_ from: (Int, Int), _ to: (Int, Int)) -> Int {
    return abs(from.0 - to.0) + abs(from.1 - to.1)
}

func bfs(_ root: Int, _ n: Int) -> Bool {
    var isVisited = [Bool](repeating: false, count: n + 2)
    var queue = [root]
    isVisited[root] = true
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for nextNode in graph[node, default: []] {
            if nextNode == n + 1 {
                return true
            }
            if !isVisited[nextNode] {
                queue.append(nextNode)
                isVisited[nextNode] = true
            }
        }
    }
    return false
}

let t = Int(readLine()!)!
var graph: [Int: [Int]] = [:]
for _ in 0..<t {
    let n = Int(readLine()!)!
    var nodes: [Int: (Int, Int)] = [:]
    graph = [:]
    for key in 0...n + 1 {
        let node = readLine()!.split(separator: " ").map { Int($0)! }
        nodes[key] = (node[0], node[1])
    }
    for from in 0...n {
        for to in from + 1...n + 1 {
            if distance(nodes[from]!, nodes[to]!) <= 1000 {
                graph[from, default: []].append(to)
                graph[to, default: []].append(from)
            }
        }
    }
    print(bfs(0, n) ? "happy" : "sad")
}
