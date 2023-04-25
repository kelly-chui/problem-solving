import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    struct Queue {
        var queue: [Int] = []
        var ptr = 0
        
        func isEmpty() -> Bool {
            if queue.isEmpty {
                return true
            } else if ptr >= queue.count {
                return true
            } else {
                return false
            }
        }
        
        mutating func push(_ v: Int) {
            queue.append(v)
        }
        
        mutating func pop() -> Int {
            let front = queue[ptr]
            ptr += 1
            if ptr > 50_000 {
                queue = Array(queue[ptr...])
                ptr = 0
            }
            return front
        }
    }

    var sum1 = queue1.reduce(0) { $0 + $1 }
    var sum2 = queue2.reduce(0) { $0 + $1 }
    var size = queue1.count + queue2.count
    var queue1: Queue = Queue(queue: queue1)
    var queue2: Queue = Queue(queue: queue2)
    var answer = 0
    
    while sum1 != sum2 {
        if answer >= size {
            return -1
        }
        let diff = sum1 - sum2
        var popSum = 0
        if diff > 0 {
            while popSum * 2 < diff {
                if queue1.isEmpty() {
                    return -1
                }
                let pop = queue1.pop()
                popSum += pop
                queue2.push(pop)
                answer += 1
            }
        } else {
            while popSum * 2 > diff {
                if queue2.isEmpty() {
                    return -1
                }
                let pop = queue2.pop()
                popSum -= pop
                queue1.push(pop)
                answer += 1
            }
        }
        sum1 -= popSum
        sum2 += popSum
    }
    
    return answer
}
