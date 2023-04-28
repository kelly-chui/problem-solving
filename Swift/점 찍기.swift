import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var answer = 0
    for x in stride(from: 0, to: d + 1, by: k) {
        let yPoints = Int(sqrt(Double(d * d - x * x))) / k
        answer += yPoints + 1
    }

    return Int64(answer)
}
