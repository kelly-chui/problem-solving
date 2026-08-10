import Foundation

func solution(_ s:String) -> Int {
    let s = Array(s)
    var answer = 0
    for i in 0..<s.count {
        var count = 1
        var n = 1
        while i - n >= 0 && i + n < s.count && s[i - n] == s[i + n] {
            count += 2
            n += 1
        }
        answer = count > answer ? count : answer
    }
    for i in 0..<s.count - 1 {
        guard s[i] == s[i + 1] else { continue }
        var count = 2
        var n = 1
        while i - n >= 0 && i + n + 1 < s.count && s[i - n] == s[i + n + 1] {
            count += 2
            n += 1
        }
        answer = count > answer ? count : answer
    }
    return answer
}
