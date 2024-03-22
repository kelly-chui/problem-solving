import Foundation

struct Heap {
    var heap = [(Int, Int)]()
    var isEmpty: Bool { heap.isEmpty }
    
    mutating func push(_ v: (Int, Int)) {
        var current = heap.count
        heap.append(v)
        while current > 0 && heap[current].1 < heap[(current - 1) / 2].1 {
            heap.swapAt(current, (current - 1) / 2)
            current = (current - 1) / 2
        }
    }

    mutating func pop() -> (Int, Int) {
        let minValue = heap[0]
        var current = 0
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()

        while current * 2 + 1 < heap.count {
            let leftChild = current * 2 + 1
            let rightChild = leftChild + 1
            var minChild = leftChild
            
            if rightChild < heap.count && heap[rightChild].1 < heap[leftChild].1 {
                minChild = rightChild
            }
            if heap[current].1 < heap[minChild].1 {
                heap.swapAt(current, minChild)
                current = minChild
            } else {
                break
            }
        }
        return minValue
    }
}

func dijkstra(_ root: Int, _ dest: Int) -> Int {
    var distance = [Int](repeating: 987_654_321, count: v + 1)
    var heap = Heap()
    heap.push((root, 0))
    distance[root] = 0

    while !heap.isEmpty {
        let (node, dist) = heap.pop()
        if distance[node] < dist {
            continue
        }
        for (nextNode, nextDist) in graph[node] {
            if distance[nextNode] > dist + nextDist {
                distance[nextNode] = dist + nextDist
                heap.push((nextNode, dist + nextDist))
            }
        }
    }
    return distance[dest]
}


let vep = readLine()!.split(separator: " ").map { Int(String($0))! }
let (v, e, p) = (vep[0], vep[1], vep[2])
var graph = [[(Int, Int)]](repeating: [(Int, Int)](), count: v + 1)
for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    graph[a].append((b, c))
    graph[b].append((a, c))
}

if dijkstra(1, v) == dijkstra(1, p) + dijkstra(p, v) {
    print("SAVE HIM")
} else {
    print("GOOD BYE")
}