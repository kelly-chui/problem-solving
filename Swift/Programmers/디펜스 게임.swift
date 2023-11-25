import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    struct Heap {
        private var heap: [Int] = []
        
        var isEmpty: Bool {
            heap.isEmpty
        }
        var root: Int {
            heap[0]
        }
        
        mutating func insert(_ v: Int) {
            heap.append(v)
            var curIdx = heap.count - 1
            while curIdx > 0 && heap[curIdx] > heap[(curIdx - 1) / 2] {
                heap.swapAt(curIdx, (curIdx - 1) / 2)
                curIdx = (curIdx - 1) / 2
            }
        }
        
        mutating func delete() -> Int {
            let popped = heap.first!
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()
            var curIdx = 0
            while curIdx * 2 + 1 < heap.count {
                let lChildIdx = curIdx * 2 + 1
                let rChildIdx = lChildIdx + 1
                var mChildIdx = lChildIdx
                if rChildIdx < heap.count && heap[rChildIdx] > heap[mChildIdx] {
                    mChildIdx = rChildIdx
                }
                if heap[curIdx] < heap[mChildIdx] {
                    heap.swapAt(curIdx, mChildIdx)
                    curIdx = mChildIdx
                } else {
                    break
                }
            }
            return popped
        }
    }
    
    var answer = 0
    var nCount = n
    var invincible = k
    var enemySum = 0
    var enemyHeap = Heap()
    for idx in 0..<enemy.count where nCount > 0 {
        enemyHeap.insert(enemy[idx])
        enemySum += enemy[idx]
        if nCount < enemySum {
            guard invincible > 0 else { return answer }
            enemySum -= enemyHeap.delete()
            invincible -= 1
        }
        answer += 1
    }
    
    return answer
}
