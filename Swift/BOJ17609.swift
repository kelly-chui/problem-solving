import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let str = readLine()!.map { String($0) }
    var reverseStr = Array(str.reversed())
    var answer = 0
    var pindex = Int()
    for index in 0..<str.count {
        if str[index] != reverseStr[index] {
            answer = 1
            pindex = index
            break
        }
    }
    if answer != 0 {
        for index in [pindex, str.count - pindex  - 1] {
            var pseudo = str
            pseudo.remove(at: index)
            if pseudo == Array(pseudo.reversed()) {
                answer = 1
                break
            }
            answer = 2
        }
    }
    print(answer)
}
