import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    struct Heap {
        var heap: [Int] = []
        
        func isEmpty() -> Bool {
            return heap.isEmpty
        }
        
        func count() -> Int {
            return heap.count
        }
        
        mutating func insert(_ value: Int) {
            heap.append(value)
            var curIdx = heap.count - 1
            
            while curIdx > 0 && heap[curIdx] < heap[(curIdx - 1) / 2] {
                heap.swapAt(curIdx, (curIdx - 1) / 2)
                curIdx = (curIdx - 1) / 2
            }
        }
        
        mutating func delete() {
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()
            var curIdx = 0
            
            while curIdx * 2 + 1 <= heap.count - 1 {
                let lChildIdx = curIdx * 2 + 1
                let rChildIdx = lChildIdx + 1
                var mChildIdx = lChildIdx
                
                if rChildIdx <= heap.count - 1 && heap[rChildIdx] < heap[lChildIdx] {
                    mChildIdx = rChildIdx
                }
                
                if heap[curIdx] > heap[mChildIdx] {
                    heap.swapAt(curIdx, mChildIdx)
                    curIdx = mChildIdx
                } else {
                    break
                }
            }
        }
    }
    
    var heap = Heap()
    var answer: [Int] = []
    
    for idx in score {
        heap.insert(idx)
        if heap.count() > k {
            heap.delete()
        }
        answer.append(heap.heap[0])
    }
    
    return answer
}
