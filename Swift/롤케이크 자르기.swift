import Foundation

func solution(_ topping:[Int]) -> Int {
    var dict1: [Int: Int] = [: ]
    var dict2: [Int: Int] = [: ]
    var answer = 0
    
    for t in topping {
        if dict2[t] == nil {
            dict2[t] = 1
        } else {
            dict2[t]! += 1
        }
    }
    
    for t in topping {
        if dict1[t] == nil {
            dict1[t] = 1
        } else {
            dict1[t]! += 1
        }
        
        dict2[t]! -= 1
        if dict2[t]! == 0 {
            dict2[t] = nil
        }
        
        if dict1.count == dict2.count {
            answer += 1
        }
    }

    return answer
}
