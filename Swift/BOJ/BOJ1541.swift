//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/19.
//

import Foundation

var expression = readLine()!
var numbers = expression.components(separatedBy: CharacterSet(charactersIn: "+, -")).map { Int(String($0))! }
var count = 0
var operators: [String] = []
var isMinus = false
for char in Array(expression) {
    if char == "+" || char == "-" {
        count += 1
        if char == "-" {
            isMinus = true
            break
        }
    }
}
var answer = 0
for i in 0..<numbers.count where isMinus {
    if i < count {
        answer += numbers[i]
    } else {
        answer -= numbers[i]
    }
}
for i in 0..<numbers.count where !isMinus {
    answer += numbers[i]
}
print(answer)
