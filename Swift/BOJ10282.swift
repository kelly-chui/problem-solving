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
        let deletedValue = heap[0]
        var curIdx = 0
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        while curIdx * 2 + 1 < heap.count {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            if rChildIdx < heap.count && heap[rChildIdx].1 < heap[lChildIdx].1 {
                mChildIdx = rChildIdx
            }
            if heap[mChildIdx].1 < heap[curIdx].1 {
                heap.swapAt(mChildIdx, curIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return deletedValue
    }
}

func dijkstra(_ start: Int, _ n: Int, _ network: [Int: [(Int, Int)]]) {
    var times = [Int](repeating: 999_999_999, count: n + 1)
    var heap = Heap()
    times[start] = 0
    heap.insert((start, 0))
    while !heap.isEmpty {
        let (computer, time) = heap.delete()
        if times[computer] < time { continue }
        if let connections = network[computer] {
            for (newComputer, newTime) in connections {
                if times[newComputer] > time + newTime {
                    times[newComputer] = time + newTime
                    heap.insert((newComputer, times[newComputer]))
                }
            }
        }
    }
    let filteredTimes = times.filter { $0 != 999_999_999 }
    print(filteredTimes.count, filteredTimes.max() ?? 0)
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let ndc = readLine()!.split(separator: " ").map { Int(String($0))! }
    var network: [Int: [(Int, Int)]] = [:]
    for _ in 0..<ndc[1] {
        let abs = readLine()!.split(separator: " ").map { Int(String($0))! }
        network[abs[1], default: []].append((abs[0], abs[2]))
    }
    dijkstra(ndc[2], ndc[0], network)
}
