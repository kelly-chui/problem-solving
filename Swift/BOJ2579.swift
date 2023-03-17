//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/17.
//

import Foundation

let n = Int(readLine()!)!
var stair = [Int](repeating: 0, count: 301)
for i in 1...n {
    stair[i] = Int(readLine()!)!
}
var dp = [Int](repeating: 0, count: 301)
dp[0] = 0
dp[1] = stair[1]
dp[2] = dp[1] + stair[2]

var idx = 3
while idx <= 300 {
    dp[idx] = max(dp[idx - 2] + stair[idx], dp[idx - 3] + stair[idx] + stair[idx - 1])
    idx += 1
}
print(dp)
print(dp[n])
