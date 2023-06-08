import Foundation

struct Heap {
    private var heap: [Int] = []
    var isEmpty: Bool { heap.isEmpty }
    mutating func insert(_ v: Int) {
        heap.append(v)
        var curIdx = heap.count - 1
        while curIdx > 0 && heap[curIdx] < heap[(curIdx - 1) / 2] {
            heap.swapAt(curIdx, (curIdx - 1 ) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func delete() -> Int {
        let minValue = heap[0]
        heap.swapAt(0, heap.count - 1)
        var curIdx = 0
        heap.removeLast()
        while curIdx * 2 + 1 < heap.count {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            if rChildIdx < heap.count && heap[rChildIdx] < heap[mChildIdx] {
                mChildIdx = rChildIdx
            }
            if heap[curIdx] > heap[mChildIdx] {
                heap.swapAt(curIdx, mChildIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return minValue
    }
}

let n = Int(readLine()!)!
var deckHeap = Heap()
for _ in 0..<n {
    deckHeap.insert(Int(readLine()!)!)
}
var answer = 0
while !deckHeap.isEmpty {
    let deck1 = deckHeap.delete()
    if deckHeap.isEmpty {
        print(answer)
        exit(0)
    }
    let deck2 = deckHeap.delete()
    deckHeap.insert(deck1 + deck2)
    answer += deck1 + deck2
}
