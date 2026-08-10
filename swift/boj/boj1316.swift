import Foundation

let n = Int(readLine()!)!
var answer = 0
for _ in 0..<n {
    let word = readLine()!.map { String($0) }
    let arrayWord = Array(word).map { String($0) }
    var refined = ""
    for idx in 0..<arrayWord.count {
        if let lastLetter = refined.last {
            if String(lastLetter) != arrayWord[idx] {
                refined += arrayWord[idx]
            }
        } else {
            refined += arrayWord[idx]
        }
    }
    var dict: [Character: Bool] = [:]
    var isGroup = true
    for char in refined {
        if dict[char] != nil {
            isGroup = false
            break
        }
        dict[char] = true
    }
    if isGroup {
        answer += 1
    }
}
print(answer)
