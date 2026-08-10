import Foundation

let n = Int(readLine()!)!
var wordDict: [String: Int] = [: ]
var words: [String] = []
for _ in 0..<n {
    let word = readLine()!
    let arrayWord = word.map { String($0) }
    var factor = 1
    for a in arrayWord.reversed() {
        if wordDict[a] != nil {
            wordDict[a]! += factor
        } else {
            wordDict[a] = factor
        }
        factor *= 10
    }
    words.append(word)
}

var wordArray: [(String, Int)] = []
for (key, value) in wordDict {
    wordArray.append((key, value))
}
wordArray.sort { $0.1 > $1.1 }
var newDict = Dictionary(uniqueKeysWithValues: zip(wordArray.map { $0.0 }, Array(0...9).reversed().map { String($0) }))
var numbers: [Int] = []
for w in words {
    let arrayW = Array(w).map { String($0) }
    numbers.append(Int(arrayW.map { newDict[$0]! }.joined())!)
}

print(numbers.reduce(0) { $0 + $1 })
