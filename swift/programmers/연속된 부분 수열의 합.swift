import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var answer = (0, sequence.count)
    var start = 0
    var end = 0
    var sum = sequence[0]
    
    while start <= end {
        if sum <= k {
            if sum == k && end - start < answer.1 - answer.0 {
                answer = (start, end)
                print(answer)
            }
            end += 1
            if end >= sequence.count {
                break
            }
            sum += sequence[end]
        } else {
            sum -= sequence[start]
            start += 1
        }
    }
    
    return [answer.0, answer.1]
}
