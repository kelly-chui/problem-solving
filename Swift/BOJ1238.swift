import Foundation

struct Heap {
    var heap: [(Int, Int)] = []

    func isEmpty() -> Bool {
        return heap.isEmpty
    }

    mutating func insert(_ node: (Int, Int)) {
        heap.append(node)
        var curIdx = heap.count - 1
        while curIdx > 0 && heap[curIdx].1 < heap[curIdx / 2].1 {
            heap.swapAt(curIdx, curIdx / 2)
            curIdx = curIdx / 2
        }
    }

    mutating func delete() -> (Int, Int) {
        var curIdx = 0
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()

        while curIdx * 2 < heap.count {
            let rChildIdx = curIdx * 2 + 1
            let lChildIdx = curIdx * 2
            var minChildIdx = lChildIdx
            if rChildIdx < heap.count && heap[rChildIdx].1 < heap[minChildIdx].1 {
                minChildIdx = rChildIdx
            }
            if heap[minChildIdx].1 < heap[curIdx].1 {
                heap.swapAt(minChildIdx, curIdx)
                curIdx = minChildIdx
            } else {
                break
            }
        }
        return min
    }
}

func dijkstra(_ start: Int) -> [Int] {
    var heap = Heap()
    var distances = [Int](repeating: 1_000_000_000, count: nmx[0] + 1)
    heap.insert((start, 0))
    distances[start] = 0

    while !heap.isEmpty() {
        let (node, dist) = heap.delete()
        if distances[node] < dist {
            continue
        }
        for i in graph[node] {
            if distances[i.0] > dist + i.1 {
                distances[i.0] = dist + i.1
                heap.insert((i.0, dist + i.1))
            }
        }
    }
    return distances
}

let nmx = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph = Array(repeating: [(Int, Int)](), count: nmx[0] + 1)
var distanceTable = [Int](repeating: 0, count: nmx[0] + 1)
for _ in 0..<nmx[1] {
    let startEndT = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[startEndT[0]].append((startEndT[1], startEndT[2]))
}
distanceTable = dijkstra(nmx[2])

for student in 1...nmx[0] {
    distanceTable[student] += dijkstra(student)[nmx[2]]
}
print(distanceTable[1...].max()!)
