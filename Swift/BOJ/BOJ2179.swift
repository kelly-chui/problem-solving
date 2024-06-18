let n = Int(readLine()!)!
var input = Set<String>()
for idx in 0..<n {
    input.insert((idx, readLine()!))
}
let words = input.sorted()
var (s, t) = ("", "")
var maxCount = 0
for idx1 in 0..<words.count - 1 {
    let (word1, word2) = (Array(words[idx1]), Array(words[idx1 + 1]))
    var count = 0
    for idx2 in 0..<min(word1.count, word2.count) {
        if word1[idx2] == word2[idx2] {
            count += 1
        } else {
            break
        }
    }
    if count > maxCount {
        maxCount = count
        (s, t) = (words[idx1], words[idx1 + 1])
    }
}

print("\(s)\n\(t)")