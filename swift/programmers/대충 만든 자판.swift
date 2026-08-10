import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var dict: Dictionary<String, Int> = [: ]
    var answer: Array<Int> = []
    
    for k in keymap {
        let key = Array(k).map { String($0) }
        for idx in 0..<key.count {
            if dict[key[idx]] == nil {
                dict[key[idx]] = idx + 1
            } else if dict[key[idx]]! > idx + 1 {
                dict[key[idx]] = idx + 1
            }
        }
    }
    
    for t in targets {
        let target = Array(t).map { String($0) }
        var sum = 0
        var isPossible = true
        for element in target {
            if dict[element] == nil {
                answer.append(-1)
                isPossible = false
                break
            }
            sum += dict[element]!
        }
        
        if isPossible {
            answer.append(sum)
        }
    }
    
    return answer
}
