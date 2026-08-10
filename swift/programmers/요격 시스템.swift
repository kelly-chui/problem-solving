import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted { $0[1] < $1[1] }
    var end = 0
    var answer = 0
    for target in targets {
        if target[0] >= end {
            answer += 1
            end = target[1]
        }
    }
    return answer
}
