// https://school.programmers.co.kr/learn/courses/30/lessons/468370

import Foundation

func solution(_ message: String, _ spoilerRanges: [[Int]]) -> Int {
    let chars = Array(message)
    var words: [(word: String, start: Int, end: Int)] = []
    var start = 0
    while start < chars.count {
        if chars[start] == " " {
            start += 1
            continue
        }
        var end = start
        while end + 1 < chars.count && chars[end + 1] != " " {
            end += 1
        }
        let word = String(chars[start...end])
        words.append((word, start, end))
        start = end + 1
    }
    var spoilerIndex = Array(repeating: -1, count: chars.count)
    for (index, range) in spoilerRanges.enumerated() {
        let left = range[0]
        let right = range[1]
        for i in left...right {
            spoilerIndex[i] = index
        }
    }
    var normalWords = Set<String>()
    var spoilerWords: [
        (word: String, revealTime: Int, start: Int)
    ] = []
    for item in words {
        var isSpoilerWord = false
        var revealTime = -1
        var hasNormalCharacter = false
        for i in item.start...item.end {
            if spoilerIndex[i] == -1 {
                hasNormalCharacter = true
            } else {
                isSpoilerWord = true
                revealTime = max(revealTime, spoilerIndex[i])
            }
        }
        if isSpoilerWord {
            spoilerWords.append(
                (
                    word: item.word,
                    revealTime: revealTime,
                    start: item.start
                )
            )
        } else if hasNormalCharacter {
            normalWords.insert(item.word)
        }
    }
    spoilerWords.sort {
        if $0.revealTime != $1.revealTime {
            return $0.revealTime < $1.revealTime
        }
        return $0.start < $1.start
    }
    var revealedWords = Set<String>()
    var answer = 0
    for item in spoilerWords {
        if !normalWords.contains(item.word)
            && !revealedWords.contains(item.word) {
            answer += 1
        }
        revealedWords.insert(item.word)
    }
    return answer
}
