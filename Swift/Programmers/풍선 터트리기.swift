import Foundation

func solution(_ a:[Int]) -> Int {
    var answer = 0
    var rightMin = a
    var leftMin = a
    for i in a.indices {
        guard i != 0 else { continue }
        leftMin[i] = min(leftMin[i - 1], leftMin[i])
    }
    for i in stride(from: a.count - 1, through: 0, by: -1) {
        guard i != a.count - 1 else { continue }
        rightMin[i] = min(rightMin[i + 1], rightMin[i])
    }
    for i in a.indices {
        if a[i] <= leftMin[i] || a[i] <= rightMin[i] {
            answer += 1
        }
    }
    return answer
}
