import Foundation

func solution(_ numbers:[Int]) -> String {
    
    func bigSort (_ int1: Int, _ int2: Int) -> Bool {
        if int1 == int2 {
            return true
        }
        let string1 = String(int1)
        let string2 = String(int2)
        
        if string1 + string2 > string2 + string1 {
            return true
        } else {
            return false
        }
    }
    var answer = numbers.sorted(by: bigSort).map { String($0) }.joined()
    if answer.filter({ $0 == "0" }).count == answer.count {
        answer = "0"
    }
    return answer
}
