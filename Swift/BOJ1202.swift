import Foundation

typealias Gem = (w: Int, v: Int)

struct Heap {
    private var heap: [Gem] = []
    var isEmpty: Bool {
        heap.isEmpty
    }
    mutating func insert(_ v: Gem) {
        heap.append(v)
        var curIdx = heap.count - 1
        while curIdx > 0 && heap[curIdx].v > heap[(curIdx - 1) / 2].v {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func delete() -> Gem {
        let popped = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 < heap.count {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            if rChildIdx < heap.count && heap[rChildIdx].v > heap[mChildIdx].v {
                mChildIdx = rChildIdx
            }
            if heap[mChildIdx].v > heap[curIdx].v {
                heap.swapAt(mChildIdx, curIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return popped
    }
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var gems = [Gem]()
var bags = [Int]()
var gemsHeap = Heap()
var answer = 0
for _ in 0..<nk[0] {
    let mv = readLine()!.split(separator: " ").map { Int(String($0))! }
    gems.append((w: mv[0], v: mv[1]))
}
for _ in 0..<nk[1] {
    bags.append(Int(readLine()!)!)
}
bags.sort { $0 < $1 }
gems.sort { $0 < $1 }
var i = 0
for j in 0..<nk[1] {
    while i < nk[0] && gems[i].w <= bags[j] {
        gemsHeap.insert(gems[i])
        i += 1
    }
    if !gemsHeap.isEmpty {
        answer += gemsHeap.delete().v
    }
}
print(answer)
