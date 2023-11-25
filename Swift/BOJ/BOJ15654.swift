//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/22.
//

import Foundation

func backTracking(_ n: Int) {
    if n == nm[1] {
        for idx in 0..<seq.count {
            print(seq[idx], terminator: idx == seq.count - 1 ? "\n" : " ")
        }
        return
    }
    
    for number in numbers {
        if seq.contains(number) {
            continue
        }
        seq.append(number)
        backTracking(n + 1)
        seq.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
numbers.sort { $0 < $1 }
var seq: [Int] = []

backTracking(0)
