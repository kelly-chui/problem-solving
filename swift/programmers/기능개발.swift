import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var queue: [(Int, Int)] = []
    var answer: [Int] = []
    for idx in 0..<progresses.count {
        queue.append((progresses[idx], speeds[idx]))
    }
    
    while !queue.isEmpty {
        var count = 0
        for idx in 0..<queue.count {
            queue[idx].0 += queue[idx].1
        }
        while !queue.isEmpty && queue.first!.0 >= 100 {
            queue.removeFirst()
            count += 1
        }
        if count != 0 {
            answer.append(count)
        }
    }
    
    return answer
}
