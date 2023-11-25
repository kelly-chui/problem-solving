import Foundation

func solution(_ babbling:[String]) -> Int {
    let speaks = ["aya", "ye", "woo", "ma"]
    var answer = 0
    
    for b in babbling {
        var idx = 0
        var bab = b
        var isPossible = true
        for speak in speaks {
            bab = bab.replacingOccurrences(of: speak, with: String(idx))
            idx += 1
        }
        print(bab)
        if Int(bab) == nil {
            if bab.count == 1 {
                answer += 1
                continue
            }
        } else {
            continue
        }
        for i in 1..<bab.count {
            if Array(bab)[i] == Array(bab)[i - 1] {
                isPossible = false
            }
        }
        answer += isPossible ? 1 : 0
    }
    return answer
}
