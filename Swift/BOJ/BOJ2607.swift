import Foundation

let n = Int(readLine()!)!
let firstWord = Array(readLine()!)
var answer = 0
for _ in 0..<n-1 {
    var firstWord = firstWord
    let word = readLine()!
    var count = 0
    
    for char in word {
        if firstWord.contains(char) {
            firstWord.remove(at: firstWord.firstIndex(of: char)!)
        } else {
            count += 1
        }
    }
    if count < 2 && firstWord.count < 2 {
        answer += 1
    }
}

print(answer)
