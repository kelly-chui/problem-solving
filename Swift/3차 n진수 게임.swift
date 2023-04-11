func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var strings: [String] = []
    var answer = ""
    var index = 0
    
    while strings.count < m * (t - 1) + p {
        strings += Array(String(index, radix: n)).map { String($0) }
        index += 1
    }
    
    var n = 0
    while n < t {
        answer += strings[(p + n * m) - 1]
        n += 1
    }
    
    return answer.uppercased()
}
