//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/23.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var stickers: [[Int]] = []
    stickers.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    stickers.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    if n == 1 {
        print(max(stickers[0][0], stickers[1][0]))
        continue
    }
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 3)
    
    dp[0][1] = stickers[0][0]
    dp[1][1] = stickers[1][0]
    dp[2][1] = 0
    
    for idx in 2...n {
        dp[0][idx] = max(dp[1][idx - 1], dp[2][idx - 1]) + stickers[0][idx - 1]
        dp[1][idx] = max(dp[0][idx - 1], dp[2][idx - 1]) + stickers[1][idx - 1]
        dp[2][idx] = max(dp[0][idx - 1], dp[1][idx - 1], dp[2][idx - 1])
    }
    print(max(dp[0][n], dp[1][n], dp[2][n]))
}
