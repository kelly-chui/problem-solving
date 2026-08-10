func solution(_ msg:String) -> [Int] {
    let message = Array(msg).map { String($0) }
    var lzw = Dictionary(uniqueKeysWithValues: zip((65...90).map({ String(UnicodeScalar($0)) }), 1...26))
    var (start, end) = (0, 0)
    var index = 27
    var answer: [Int] = []
    
    while start < message.count {
        var tempStr = message[start]
        end = start + 1
        while end < message.count {
            if lzw[tempStr + message[end]] == nil {
                answer.append(lzw[tempStr]!)
                lzw[tempStr + message[end]] = index
                index += 1
                break
            } else {
                tempStr += message[end]
                end += 1
            }
        }
        if end == message.count {
            answer.append(lzw[tempStr]!)
        }
        start = end
    }
    
    return answer
}
