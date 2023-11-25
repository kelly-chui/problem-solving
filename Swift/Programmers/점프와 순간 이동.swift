import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = 1
    var newN = n
    
    while newN > 1 {
        if newN % 2 == 1 {
            answer += 1
        }
        newN /= 2
    }
    
    return answer
}
