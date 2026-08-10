import Foundation

struct Heap {
    var heap = [(Int, Int)]()
    var isEmpty: Bool { heap.isEmpty }
    mutating func push(_ value: (Int, Int)) {
        heap.append(value)
        var curIdx = heap.count - 1
        while curIdx > 0 && heap[curIdx].1 < heap[(curIdx - 1) / 2].1 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func pop() -> (Int, Int) {
        var returnValue = heap[0]
        heap.swapAt(0, heap.count - 1)
        var curIdx = 0
        heap.removeLast()
        while curIdx * 2 + 1 <= heap.count - 1 {
            let lChild = curIdx * 2 + 1
            let rChild = lChild + 1
            var mChild = lChild
            if rChild <= heap.count - 1 && heap[mChild].1 > heap[rChild].1 {
                mChild = rChild
            }
            if heap[mChild].1 > heap[curIdx].1 {
                heap.swapAt(mChild, curIdx)
                curIdx = mChild
            } else { break }
        }
        return returnValue
    }
}

func findFirstStep(_ from: Int, _ to: Int, _ route: [Int]) -> Int {
    var curNode = to
    while true {
        if from == route[curNode] {
            return curNode
        } else {
            curNode = route[curNode]
        }
    }
}

func dijkstra(start: Int) -> ([Int], [Int]) {
    var heap = Heap()
    var distances = [Int](repeating: 987_654_321, count: n + 1)
    var routes = [Int](repeating: 0, count: n + 1)
    heap.push((start, 0))
    distances[start] = 0
    while !heap.isEmpty {
        let (node, distance) = heap.pop()
        if distances[node] < distance {
            continue
        }
        for (newNode, newDistance) in graph[node, default: []] {
            if distances[newNode] > distance + newDistance {
                distances[newNode] = distance + newDistance
                heap.push((newNode, distances[newNode]))
                routes[newNode] = node
            }
        }
    }
    return (distances, routes)
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph: [Int: [(Int, Int)]] = [:]
var answer = [[String]](repeating: [String](repeating: "-", count: n + 1), count: n + 1)
for _ in 0..<m {
    let route = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[route[0], default: []].append((route[1], route[2]))
    graph[route[1], default: []].append((route[0], route[2]))
}

for from in 1...n {
    let (_, routes) = dijkstra(start: from)
    for to in 1...n {
        if to == from { continue }
        answer[from][to] = String(findFirstStep(from, to, routes))
    }
}
for from in 1...n {
    for to in 1...n {
        print(answer[from][to], terminator: " ")
    }
    print()
}
