import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dict: [String: Int] = [: ]
    var answer: [Int] = []
    
    for idx in 0..<name.count {
        dict[name[idx]] = yearning[idx]
    }
    
    for p in photo {
        answer.append(p.map { dict[$0] ?? 0 }.reduce(0) { $0 + $1 })
    }
    
    return answer
}
