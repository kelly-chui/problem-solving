import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict: [String: Int] = [: ]
    var answer = 1
    
    for cloth in clothes {
        if dict[cloth[1]] == nil {
            dict[cloth[1]] = 1
        } else {
            dict[cloth[1]]! += 1
        }
    }
    for (_, value) in dict {
        answer = answer * (value + 1)
    }
    
    return answer - 1
}
