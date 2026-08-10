//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let k = Int(readLine()!)!
var seq: [Int] = []
for _ in 0..<k {
    let integer = Int(readLine()!)!
    if integer == 0 {
        seq.removeLast()
    } else {
        seq.append(integer)
    }
}

print(seq.reduce(0, { $0 + $1 }))
