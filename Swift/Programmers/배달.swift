import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    
    struct Heap {
        var heap: [(Int, Int)] = []
        
        func isEmpty() -> Bool {
            return heap.isEmpty
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

    var graph = [[(Int, Int)]](repeating: [], count: N + 1)
    
    for r in road {
        graph[r[0]].append((r[1], r[2]))
        graph[r[1]].append((r[0], r[2]))
    }
    
    func dijkstra(_ start: Int, _ n: Int) -> [Int] {
        var distances = [Int](repeating: 999_999_999_999, count: n + 1)
        distances[start] = 0
        var heap = Heap()
        heap.insert((start, 0))
        
        while !heap.isEmpty() {
            let (town, dist) = heap.delete()
            if distances[town] < dist {
                continue
            }
            for (newTown, newDist) in graph[town] {
                if distances[newTown] > dist + newDist {
                    distances[newTown] = dist + newDist
                    heap.insert((newTown, dist + newDist))
                }
            }
        }
        return distances
    }
    var distances = dijkstra(1, N)
    var answer = distances.filter { $0 <= k }.count

    return answer
}
