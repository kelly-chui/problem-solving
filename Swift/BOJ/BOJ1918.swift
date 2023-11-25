//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/28.
//

import Foundation

let sentence = Array(readLine()!)
var stack: [String] = []
var dict = ["*": 0, "/": 0, "+": 1, "-": 1, "(": 2, ")": 2]
var operators = ["*", "/", "+", "-"]
var ptr = 0
var answer = ""

for char in sentence {
    let character = String(char)
    if operators.contains(character) {
        while !stack.isEmpty {
            if let last = stack.last {
                if dict[last]! <= dict[character]! {
                    answer += stack.popLast()!
                } else {
                    break
                }
            }
        }
        stack.append(character)
    } else if character == "(" {
        stack.append(character)
    } else if character == ")" {
        var character = stack.popLast()
        while character != "(" {
            answer += character!
            character = stack.popLast()
        }
    } else {
        answer += character
    }
}

while !stack.isEmpty {
    answer += stack.popLast()!
}

print(answer)
