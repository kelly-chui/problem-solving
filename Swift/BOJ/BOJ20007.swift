import Foundation

struct Heap {
    private var heap: [(Int, Int)] = []
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    mutating func insert(_ v: (Int, Int)) {
        heap.append(v)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].1 < heap[(curIdx - 1) / 2].1 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() -> (Int, Int) {
        let popped = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 < heap.count {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx < heap.count && heap[rChildIdx].1 < heap[mChildIdx].1 {
                mChildIdx = rChildIdx
            }
            
            if heap[curIdx].1 > heap[mChildIdx].1 {
                heap.swapAt(curIdx, mChildIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return popped
    }
}

func dijkstra(_ start: Int) -> [Int] {
    var distances = [Int](repeating: 999_999_999, count: n)
    var heap = Heap()
    heap.insert((start, 0))
    distances[start] = 0
    
    while !heap.isEmpty {
        let (node, dist) = heap.delete()
        if distances[node] < dist {
            continue
        }
        if let newNodes = graph[node] {
            for (newNode, newDist) in newNodes {
                if distances[newNode] > dist + newDist {
                    distances[newNode] = dist + newDist
                    heap.insert((newNode, dist + newDist))
                }
            }
        }
    }
    return distances
}

let nmxy = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, x, y) = (nmxy[0], nmxy[1], nmxy[2], nmxy[3])
var graph: [Int: [(Int, Int)]] = [:]
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[abc[0], default: []].append((abc[1], abc[2]))
    graph[abc[1], default: []].append((abc[0], abc[2]))
}
var answer = 1
var distances = dijkstra(y).sorted { $0 < $1 }
if let longestDistance = distances.last,
    longestDistance * 2 > x {
    print(-1)
    exit(0)
}
var movingDistance = 0
for distance in distances {
    if (movingDistance + distance) * 2 <= x {
        movingDistance += distance
    } else {
        movingDistance = distance
        answer += 1
    }
}
print(answer)
