import Foundation

struct Heap {
    var heap: [(Int, Int)] = []

    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(_ value: (Int, Int)) {
        heap.append(value)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].1 < heap[(curIdx - 1) / 2].1 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }

    mutating func delete() -> (Int, Int) {
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0

        while curIdx * 2 + 1 <= heap.count - 1 {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx <= heap.count - 1 && heap[rChildIdx].1 < heap[lChildIdx].1 {
                mChildIdx = rChildIdx
            }

            if heap[mChildIdx].1 < heap[curIdx].1 {
                heap.swapAt(mChildIdx, curIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return min
    }
}

func dijkstra(start: Int) -> ([Int], [Int]) {
    var heap = Heap()
    var distances = Array(repeating: 100_001, count: n + 1)
    var routes = [Int](repeating: 0, count: n + 1)
    heap.insert((start, 0))
    distances[start] = 0
    while !heap.isEmpty() {
        let (node, dist) = heap.delete()
        if distances[node] < dist {
            continue
        }
        for (newNode, newDist) in graph[node] {
            if dist + newDist < distances[newNode] {
                distances[newNode] = dist + newDist
                routes[newNode] = node
                heap.insert((newNode, dist + newDist))
            }
        }
    }
    return (distances, routes)
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[(Int, Int)]](repeating: [], count: m + 1)
for _ in 0..<m {
    let sec = readLine()!.split(separator: " ").map { Int(String($0))! } 
    graph[sec[0]].append((sec[1], sec[2]))
}
let startEnd = readLine()!.split(separator: " ").map { Int(String($0))! }

let (distance, routes) = dijkstra(start: startEnd[0])
print(distance[startEnd[1]])

var answer: [Int] = []

var idx = startEnd[1]
answer.append(startEnd[1])
while idx != startEnd[0] {
    idx = routes[idx]
    answer.append(idx)
}
print(answer.count)
for i in answer.reversed() {
    print(i, terminator: " ")
}
