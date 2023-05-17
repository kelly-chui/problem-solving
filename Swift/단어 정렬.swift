import Foundation

let n = Int(readLine()!)!
var words: Set<String> = []
var arrayWords =  [String]()
for _ in 0..<n {
    words.insert(readLine()!)
}

arrayWords = words.sorted {
    if $0.count != $1.count {
        return $0.count < $1.count
    } else {
        return $0 < $1
    }
}

for word in arrayWords {
    print(word)
}
