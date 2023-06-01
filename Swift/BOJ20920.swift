import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var vocaList = [String: Int]()
for _ in 0..<nm[0] {
    let word = readLine()!
    if word.count < nm[1] {
        continue
    }
    vocaList[word, default: 0] += 1
}

let sortedList = vocaList.sorted {
    if $0.value != $1.value {
        return $0.value > $1.value
    } else if $0.key.count != $1.key.count {
        return $0.key.count > $1.key.count
    } else {
        return $0.key < $1.key
    }
}

for (key, _) in sortedList {
    print(key)
}
