//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let n = Int(readLine()!)!
var seq: [Int] = []
for _ in 0..<n {
    seq.append(Int(readLine()!)!)
}
var setSeq = Set(seq)
seq = Array(setSeq)

for number in seq.sorted() {
    print(number)
}
