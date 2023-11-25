import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    struct Queue {
        var queue: [(Int, Int)] = []
        var ptr = 0
        
        func isEmpty() -> Bool {
            if queue.isEmpty {
                return true
            } else {
                return ptr >= queue.count
            }
        }
        
        func size() -> Int {
            return queue.count - ptr
        }
        
        func first() -> (Int, Int) {
            return queue[ptr]
        }
        
        mutating func addTime() {
            for idx in ptr..<queue.count {
                queue[idx].1 += 1
            }
        }
        
        mutating func push(_ v: (Int, Int)) {
            queue.append(v)
        }
        
        mutating func pop() {
            ptr += 1
            if ptr > 500 {
                queue = Array(queue[ptr...])
                ptr = 0
            }
        }
    }
    
    var rTrucks = Array(truck_weights.reversed())
    var queue = Queue()
    var bridge_weight = 0
    var answer = 1
    let last = rTrucks.removeLast()
    queue.push((last, 0))
    bridge_weight = last
    
    while !queue.isEmpty() {
        queue.addTime()
        if queue.first().1 > bridge_length - 1 {
            bridge_weight -= queue.first().0
            queue.pop()
        }
        if !rTrucks.isEmpty {
            let truck = rTrucks.last!
            if bridge_weight + truck <= weight && queue.size() + 1 <= bridge_length {
                let t = rTrucks.removeLast()
                queue.push((t, 0))
                bridge_weight += t
            }
        }
        answer += 1
    }
    
    return answer
}
