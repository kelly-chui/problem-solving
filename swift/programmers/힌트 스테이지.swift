// https://school.programmers.co.kr/learn/courses/30/lessons/468377

import Foundation

func solution(_ cost: [[Int]], _ hint: [[Int]]) -> Int {
    let n = cost.count
    var answer = Int.max
    
    for mask in 0..<(1 << (n - 1)) {
        var current = Array(repeating: 0, count: n)
        var totalCost = 0
        for s in 0..<(n - 1) {
            if mask & (1 << s) != 0 {
                totalCost += hint[s][0]
                for idx in 1..<hint[s].count {
                    let h = hint[s][idx] - 1
                    current[h] = min(current[h] + 1, n - 1)
                }
            }
        }
        for s in 0..<n {
            totalCost += cost[s][current[s]]
        }
        answer = min(answer, totalCost)
    }
    return answer
}
