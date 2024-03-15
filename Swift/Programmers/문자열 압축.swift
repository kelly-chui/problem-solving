import Foundation

func solution(_ s:String) -> Int {
    if s.count == 1 {
        return 1
    }
    let len = s.count 
    var answer = len
    for unitSize in 1...(len / 2) {
        var compressed = ""
        var prev = ""
        var count = 1
        for idx in stride(from: 0, to: len, by: unitSize) {
            let subStr = String(s[s.index(s.startIndex, offsetBy: idx)..<s.index(s.startIndex, offsetBy: min(idx + unitSize, len))])
            
            if prev == subStr {
                count += 1
            } else {
                compressed += (count == 1 ? "" : "\(count)") + prev
                prev = subStr
                count = 1
            }
        }
        compressed += (count == 1 ? "" : "\(count)") + prev
        answer = min(answer, compressed.count)
    }
    
    return answer
}
