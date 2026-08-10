//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/23.
//

import Foundation

func backTracking(_ length: Int) {
    if length == m {
        answers.append(seq)
        return
    }
    
    for idx in 0..<numbers.count {
        if isVisited[idx] {
            continue
        }
        isVisited[idx] = true
        seq.append(numbers[idx])
        backTracking(length + 1)
        seq.removeLast()
        isVisited[idx] = false
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
numbers.sort { $0 < $1 }
var seq: [Int] = []
var answers: [[Int]] = []
var isVisited = [Bool](repeating: false, count: n)

backTracking(0)

answers = Array(Set(answers)).sorted {
    var idx = 0
    while true {
        if $0[idx] == $1[idx] {
            idx += 1
        } else if $0[idx] > $1[idx] {
            return false
        } else {
            return true
        }
    }
}

for seq in answers {
    for element in seq {
        print(element, terminator: " ")
    }
    print()
}
