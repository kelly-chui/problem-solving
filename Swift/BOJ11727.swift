//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/17.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 3
for idx in 3...1000 {
    dp[idx] = (dp[idx - 1] + (dp[idx - 2] * 2)) % 10_007
}

print(dp[n])
