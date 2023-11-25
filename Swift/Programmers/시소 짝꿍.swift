import Foundation

func solution(_ weights: [Int]) -> Int {
    var answer = 0
    var info = [Double: Int]()
    for w in weights {
        let w = Double(w)
        answer += info[w, default: 0]
        answer += info[w * 2, default: 0]
        answer += info[w / 2, default: 0]
        answer += info[(w * 2) / 3, default: 0]
        answer += info[(w * 3) / 2, default: 0]
        answer += info[(w * 4) / 3, default: 0]
        answer += info[(w * 3) / 4, default: 0]
        info[w, default: 0] += 1
    }
    return answer
}
