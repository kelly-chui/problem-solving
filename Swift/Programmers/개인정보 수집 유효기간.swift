import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var dict: [String: Int] = [: ]
    var answer: [Int] = []
    
    for term in terms {
        let t = term.split(separator: " ").map{ String($0) }
        dict[t[0]] = Int(t[1])!
    }
    
    for idx in 0..<privacies.count {
        let p = privacies[idx].split(separator: " ").map { String($0) }
        let date = p[0].split(separator: ".").map { Int(String($0))! }
        var deleteDate = date
        
        if deleteDate[1] + dict[p[1]]! > 12 {
            deleteDate[0] += ((deleteDate[1] + dict[p[1]]!) - 1) / 12
            deleteDate[1] = ((deleteDate[1] + dict[p[1]]!) - 1) % 12 + 1
        } else {
            deleteDate[1] += dict[p[1]]!
        }
        
        let ttoday = today.split(separator: ".").map { Int(String($0))! }
        
        if ttoday[0] > deleteDate[0] {
            answer.append(idx + 1)
        } else if ttoday[0] == deleteDate[0] {
            if ttoday[1] > deleteDate[1] {
                answer.append(idx + 1)
            } else if ttoday[1] == deleteDate[1] {
                if ttoday[2] >= deleteDate[2] {
                    answer.append(idx + 1)
                }
            }
        }
    }
    return answer
}
