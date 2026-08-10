import Foundation

struct Heap {
    var heap: [(Int, Int)] = []
    
    func isEmpty() -> Bool {
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
        let minValue = heap[0]
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
        return minValue
    }
}

func dijkstra(_ start: Int) -> [Int] {
    var distances = [Int](repeating: 999_999_999_999, count: n + 1)
    var heap = Heap()
    heap.insert((start, 0))
    distances[start] = 0
    
    while !heap.isEmpty() {
        let (node, dist) = heap.delete()
        if distances[node] < dist {
            continue
        }
        for (newNode, newDist) in graph[node]! {
            if distances[newNode] > newDist + dist {
                distances[newNode] = newDist + dist
                heap.insert((newNode, newDist + dist))
            }
        }
    }
    return distances
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph: [Int: [(Int, Int)]] = [: ]
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    if graph[abc[0]] != nil {
        graph[abc[0]]!.append((abc[1], abc[2]))
    } else {
        graph[abc[0]] = [(abc[1], abc[2])]
    }
    if graph[abc[1]] != nil {
        graph[abc[1]]!.append((abc[0], abc[2]))
    } else {
        graph[abc[1]] = [(abc[0], abc[2])]
    }
}

print(dijkstra(1)[n])

