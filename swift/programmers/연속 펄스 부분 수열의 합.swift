import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    var answer = max(sequence[0], -sequence[0])
    var sum1 = sequence[0]
    var sum2 = -sequence[0]
    for i in 1..<sequence.count {
        if i % 2 == 1  {
            sum1 = max(sum1 - sequence[i], -sequence[i])
            sum2 = max(sum2 + sequence[i], sequence[i])
        } else {
            sum1 = max(sum1 + sequence[i], +sequence[i])
            sum2 = max(sum2 - sequence[i], -sequence[i])
        }
        answer = max(sum1, sum2, answer)
    }
    return Int64(answer)
}
