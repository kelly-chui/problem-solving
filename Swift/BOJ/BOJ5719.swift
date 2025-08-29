// https://www.acmicpc.net/problem/5719

typealias HeapNode = (destination: Int, cost: Int)
struct Route: Hashable {
    var start: Int
    var destination: Int
}
struct Heap {
    private var heap = [HeapNode]()
    var isEmpty: Bool { heap.isEmpty }
    mutating func push(_ node: HeapNode) {
        var currentIdx = heap.count
        heap.append(node)
        while currentIdx > 0 && heap[currentIdx].cost < heap[(currentIdx - 1) / 2].cost {
            heap.swapAt(currentIdx, (currentIdx - 1) / 2)
            currentIdx = (currentIdx - 1) / 2
        }
    }
    mutating func pop() -> HeapNode {
        var currentIdx = 0
        heap.swapAt(0, heap.count - 1)
        let minValue = heap.removeLast()
        while currentIdx * 2 + 1 < heap.count {
            let leftChildIdx = currentIdx * 2 + 1
            let rightChildIdx = leftChildIdx + 1
            var minChildIdx = leftChildIdx
            if rightChildIdx < heap.count && heap[rightChildIdx].cost < heap[minChildIdx].cost {
                minChildIdx = rightChildIdx
            }
            guard heap[minChildIdx].cost >= heap[currentIdx].cost else { break }
            heap.swapAt(currentIdx, minChildIdx)
            currentIdx = minChildIdx
        }
        return minValue
    }
}
func findShortestPath(
        start: Int,
        destination: Int,
        n: Int,
        graph: [Int: [(Int, Int)]],
        checkedEdges: inout Set<Route>
    ) -> (Int, [[Int]]) {
    var distances = [Int](repeating: Int.max, count: n)
    var parents = [[Int]](repeating: [], count: n)
    var heap = Heap()
    heap.push((start, 0))
    distances[start] = 0
    while !heap.isEmpty {
        let (node, distance) = heap.pop()
        guard distances[node] >= distance else { continue }
        for (nextNode, nextDistance) in graph[node, default: []] {
            guard !checkedEdges.contains(Route(start: node, destination: nextNode)) else { continue }
            if distances[nextNode] > distance + nextDistance { 
                distances[nextNode] = distance + nextDistance
                parents[nextNode] = [node]
                heap.push((nextNode, distance + nextDistance))
            } else if distances[nextNode] == distance + nextDistance {
                parents[nextNode].append(node)
            }
        }
    }
    return (distances[destination], parents)
}
func checkEdges(
        n: Int,
        parents: [[Int]],
        start: Int,
        destination: Int
    ) -> Set<Route> {
    var stack = [destination]
    var visited = [Bool](repeating: false, count: n)
    var checkedEdges = Set<Route>()
    while !stack.isEmpty {
        let node = stack.removeLast()
        guard !visited[node] else { continue }
        visited[node] = true
        for parent in parents[node] {
            checkedEdges.insert(Route(start: parent, destination: node))
            if parent != start {
                stack.append(parent)
            }
        }
    }
    return checkedEdges
}
while true {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m) = (nm[0], nm[1])
    guard n != 0 || m != 0 else { break }
    let sd = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (s, d) = (sd[0], sd[1])
    var graph = [Int: [(Int, Int)]]()
    var checkedEdges = Set<Route>()
    for _ in 0..<m {
        let uvp = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (u, v, p) = (uvp[0], uvp[1], uvp[2])
        graph[u, default: []].append((v, p))
    }
    var (_, parents) = findShortestPath(
        start: s,
        destination: d,
        n: n,
        graph: graph,
        checkedEdges: &checkedEdges
    )
    checkedEdges = checkEdges(
        n: n,
        parents: parents,
        start: s,
        destination: d
    )
    let (almostShortestDistance, _) = findShortestPath(
        start: s,
        destination: d,
        n: n,
        graph: graph,
        checkedEdges: &checkedEdges
    )
    print(almostShortestDistance == Int.max ? -1 : almostShortestDistance)
}
