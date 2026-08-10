import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var newT = Array(t)
    var newP = Int(p)!
    var answer = 0
    
    for idx in 0...t.count - p.count {
        if Int(String(Array(newT[idx..<idx + p.count])))! <= newP {
            answer += 1
        }
    }
    
    return answer
}
