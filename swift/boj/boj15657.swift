//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/23.
//

import Foundation

func backTracking(_ length: Int) {
    if length == m {
        for element in seq {
            print(element, terminator: " ")
        }
        print()
        return
    }
    
    for i in numbers {
        if seq.isEmpty {
            seq.append(i)
            backTracking(length + 1)
            seq.removeLast()
            continue
        }
        if i >= seq.last! {
            seq.append(i)
            backTracking(length + 1)
            seq.removeLast()
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
numbers.sort { $0 < $1 }
var seq: [Int] = []

backTracking(0)
