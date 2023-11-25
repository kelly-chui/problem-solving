import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var answer = 0
    var newScore = score.sorted { $0 < $1 }
    
    while newScore.count >= m {
        for idx in 0..<m {
            let rank = newScore.popLast()
            if rank == nil {
                break
            }
            if idx == m - 1 {
                answer += (rank! * m)
            }
        }
    }
    return answer
}
