import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue: [(Int, Bool)] = []
    var answer = 0
    
    for idx in 0..<priorities.count {
        if idx == location {
            queue.append((priorities[idx], true))
        } else {
            queue.append((priorities[idx], false))
        }
    }
    
    while !queue.isEmpty {
        var popped = queue.first!
        var isMax = true
        
        for q in queue {
            if q.0 > popped.0 {
                isMax = false
                queue.append(queue.removeFirst())
                break
            }
        }
        
        if isMax {
            if popped.1 {
                answer += 1
                break
            } else {
                queue.removeFirst()
                answer += 1
            }
        }
    }
    return answer
}
