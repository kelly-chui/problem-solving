//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/23.
//

import Foundation

let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var priceTable: [[Int]] = []
for _ in 0..<n {
    priceTable.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

dp[0][0] = priceTable[0][0]
dp[0][1] = priceTable[0][1]
dp[0][2] = priceTable[0][2]

for idx in 1..<n {
    dp[idx][0] = min(dp[idx - 1][1], dp[idx - 1][2]) + priceTable[idx][0]
    dp[idx][1] = min(dp[idx - 1][0], dp[idx - 1][2]) + priceTable[idx][1]
    dp[idx][2] = min(dp[idx - 1][0], dp[idx - 1][1]) + priceTable[idx][2]
}

print(dp[n - 1].min()!)
