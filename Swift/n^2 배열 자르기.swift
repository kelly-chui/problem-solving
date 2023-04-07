import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var (intLeft, intRight) = (Int(left), Int(right))
    var answer: [Int] = []
    
    for idx in intLeft...intRight {
        answer.append(max(idx / n, idx % n) + 1)
    }

    return answer
}
