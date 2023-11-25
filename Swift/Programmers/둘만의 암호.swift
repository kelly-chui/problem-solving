import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var answer = ""
    var arrayS = Array(s).map { String($0) }
    var arraySkip = Array(skip).map { String($0) }
    
    for c in arrayS {
        var temp = Int(UnicodeScalar(c)!.value)
        for _ in 0..<index {
            temp = (((temp + 1) - 97) % 26) + 97
            while true {
                if arraySkip.contains(String(UnicodeScalar(temp)!)) {
                    temp = (((temp + 1) - 97) % 26) + 97
                } else {
                    break
                }
            }
        }
        answer += String(UnicodeScalar(temp)!)
    }
    
    return answer
}
