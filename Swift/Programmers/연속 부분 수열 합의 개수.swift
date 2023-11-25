import Foundation

func solution(_ elements:[Int]) -> Int {
    var newElements = elements
    var ptr = 0
    var answer: Set<Int> = []
    
    for i in 0..<elements.count {
        var ps: [Int] = [0, newElements[0]]
        for j in 1..<newElements.count {
            ps.append(newElements[j] + ps[j])
        }
        newElements.append(elements[i])
        for k in i + 1..<ps.count {
            answer.insert(ps[k] - ps[k - i - 1])
        }
    }
    return answer.count
}
