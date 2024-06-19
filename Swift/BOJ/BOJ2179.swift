let n = Int(readLine()!)!
var words = [(Int, String)]()
for idx in 0..<n {
    words.append((idx, readLine()!))
}
words.sort {
    if $0.1 != $1.1 {
        return $0.1 < $1.1
    } else {
        return $0.0 < $1.0
    }
}

var (s, t) = ((987654321, ""), (987654321, ""))
var maxCount = 0
for idx1 in 0..<words.count - 1 {
    for idx2 in idx1 + 1..<words.count {
        let (word1, word2) =  (Array(words[idx1].1), Array(words[idx2].1))
        var count = 0
        for idx3 in 0..<min(word1.count, word2.count) {
            if word1[idx3] == word2[idx3] {
                count += 1
            } else {
                break
            }
        }
        let (tempS, tempT) = (words[idx1].0 < words[idx2].0 ? (words[idx1], words[idx2]) : (words[idx2], words[idx1]))
        if count == maxCount {
            if tempS.0 < s.0 {
                (s, t) = (tempS, tempT)
            } else if tempS.0 == s.0 {
                if tempT.0 < t.0 {
                    t = tempT
                }
            }
        } else if count > maxCount {
            maxCount = count
            (s, t) = (tempS, tempT)
        } else {
            break
        }
    }
}

print("\(s.1)\n\(t.1)")