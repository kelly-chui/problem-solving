import Foundation

func recur(_ str: String) -> Bool {
    var arrayStr = Array(str)

    while arrayStr.count >= 3 {
        for i in stride(from: 2, to: arrayStr.count, by: 2) {
            if arrayStr[i - 2] == arrayStr[i] {
                return false
            }
        }

        var newArrayStr = [Character]()
        for i in stride(from: 1, to: arrayStr.count, by: 2) {
            newArrayStr.append(arrayStr[i])
        }

        arrayStr = newArrayStr
    }

    return true
}
let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    print(recur(input) ? "YES" : "NO")
}
