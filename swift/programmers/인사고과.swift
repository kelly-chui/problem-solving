import Foundation

func solution(_ scores:[[Int]]) -> Int {
    var answer = 1
    let w = scores.first!
    var scores = scores.sorted {
        if $0[0] != $1[0] {
            return $0[0] > $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }
    var minB = scores[0][1]
    for score in scores {
        if minB > score[1] {
            if w == score { return -1 }
            continue
        }
        if score[0] + score[1] > w[0] + w[1] {
            answer += 1
        }
        minB = minB > score[1] ? minB : score[1]
    }
    return answer
}
