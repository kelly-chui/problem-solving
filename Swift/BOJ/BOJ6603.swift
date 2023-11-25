import Foundation

func backTracking(_ n: Int, _ start: Int) {
    if n == 6 {
        for index in 0..<backSeq.count {
            print(backSeq[index], terminator: index != backSeq.count - 1 ? " " : "")
        }
        print()
        return
    }
    for index in start..<s.count {
        backSeq.append(s[index])
        backTracking(n + 1, index + 1)
        backSeq.removeLast()
    }
}

var backSeq: [Int] = []
var s: [Int] = []

while true {
    s = readLine()!.split(separator: " ").map { Int(String($0))! }
    if s[0] == 0 {
        break
    }
    backTracking(0, 1)
    print()
}
