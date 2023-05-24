import Foundation

func isPalinedrome(_ s: [String]) -> Bool {
    if s.count == 1 {
        return true
    }
    for index in 0...(s.count - 1) / 2 {
        if s[index] != s[s.count - index - 1] {
            return false
        }
    }
    return true
}

var s = Array(readLine()!).map { String($0) }
var index = 0

while !isPalinedrome(s) {
    s.insert(s[index], at: s.count - index)
    index += 1
}
print(s.count)
