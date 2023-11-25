import Foundation

let s = Array(readLine()!).map { String($0) }
var words: [(word: String, isTag: Bool)] = []
var lastPointer = 0
var isTag = false
var answer = ""
for index in 0..<s.count {
    if s[index] == "<" {
        if index != 0 && s[index - 1] != ">" {
            words.append((s[lastPointer...index - 1].joined(), false))
        }
        lastPointer = index
        isTag = true
        continue
    } else if s[index] == " " {
        if isTag {
            continue
        } else {
            words.append((s[lastPointer...index - 1].joined(), false))
            lastPointer = index + 1
        }
    } else if s[index] == ">" {
        words.append((s[lastPointer...index].joined(), true))
        lastPointer = index + 1
        isTag = false
        continue
    }
    if index == s.count - 1 && !isTag {
        words.append((s[lastPointer...index].joined(), false))
    }
}

var isWord = false
for w in words {
    if w.isTag {
        isWord = false
        answer += w.word
    } else {
        if isWord {
            answer += " " + String(w.word.reversed())
        } else {
            answer += String(w.word.reversed())
        }
        isWord = true
    }
}

print(answer)
