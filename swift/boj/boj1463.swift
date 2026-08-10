//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/18.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1_000_001)
dp[1] = 0
dp[2] = 1
dp[3] = 1
if n > 3 {
    for idx in 4...n {
        if idx % 2 == 0 {
            if idx % 3 == 0 {
                dp[idx] = min(dp[idx / 3], dp[idx / 2], dp[idx - 1]) + 1
                continue
            }
            dp[idx] = min(dp[idx / 2], dp[idx - 1]) + 1
            continue
        }
        if idx % 3 == 0 {
            dp[idx] = min(dp[idx / 3], dp[idx - 1]) + 1
            continue
        }
        dp[idx] = dp[idx - 1] + 1
    }
}

print(dp[n])
