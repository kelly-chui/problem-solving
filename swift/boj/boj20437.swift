import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let w = Array(readLine()!)
    let k = Int(readLine()!)!

    var isAnswer = false
    var countDict: [Character: [Int]] = [:]
    for idx in 0..<w.count {
        countDict[w[idx], default: []].append(idx)
        if countDict[w[idx]]!.count >= k {
            isAnswer = true
        }
    }

    if isAnswer {
        var answer = (987_654_321, 0)
        for indices in countDict.values {
            var (start, end) = (0, k - 1)
            while end < indices.count {
                let length = indices[end] - indices[start] + 1
                answer.0 = min(answer.0, length)
                answer.1 = max(answer.1, length)
                (start, end) = (start + 1, end + 1)
            }
        }
        print(answer.0, answer.1)
    } else {
        print(-1)
    }
}
