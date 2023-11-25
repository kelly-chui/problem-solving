import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var temp: [Int] = []
    for number in 0...9 {
        let strNum = String(number)
        let nx = X.filter { String($0) == strNum }.count
        let ny = Y.filter { String($0) == strNum }.count
        
        for i in 0..<min(nx, ny) {
            temp.append(number)
        }
    }
    
    temp.sort { $0 > $1 }
    var answer = temp.map { String($0) }.joined(separator: "")
    answer = answer == "" ? "-1" : answer
    
    if answer.filter { String($0) == "0" }.count == answer.count {
        answer = "0"
    }
    return answer
}
