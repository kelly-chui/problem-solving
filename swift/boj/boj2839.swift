//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: -1, count: 5001)
dp[3] = 1
dp[5] = 1

if n >= 6 {
    for idx in 6..<5001 {
        if dp[idx - 3] == -1 {
            if dp[idx - 5] == -1 {
                dp[idx] = -1
            } else {
                dp[idx] = dp[idx - 5] + 1
            }
        } else {
            if dp[idx - 5] == -1 {
                dp[idx] = dp[idx - 3] + 1
            } else {
                dp[idx] = min(dp[idx - 5], dp[idx - 3]) + 1
            }
        }
    }
}

print(dp[n])
