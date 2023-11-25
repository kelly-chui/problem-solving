//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let n = Int(readLine()!)!
var words: [String] = []
for _ in 0..<n {
    words.append(readLine()!)
}
var wordSet: Set<String> = Set(words)
words = Array(wordSet)
words.sort()
words.sort(by: { $0.count < $1.count })

for word in words {
    print(word)
}
