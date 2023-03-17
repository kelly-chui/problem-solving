//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/17.
//

import Foundation

let n = Int(readLine()!)!
var squareTable: [Int] = []
for i in 0...224 {
    squareTable.append(i * i)
}
var dp = [Int](repeating: 0, count: 50_001)

for i in 1...50000 {
    var minValue = 4
    var j = 1
    while i - squareTable[j] >= 0 {
        minValue = min(dp[i - squareTable[j]] + 1, minValue)
        j += 1
    }
    dp[i] = minValue
}

print(dp[n])
