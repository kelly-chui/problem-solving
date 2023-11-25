import Foundation

func solution(_ food:[Int]) -> String {
    var answer = ""
    for i in 1..<food.count {
        for j in 0..<food[i] / 2 {
            answer += String(i)
        }
    }
    return answer + "0" + answer.reversed()
}
