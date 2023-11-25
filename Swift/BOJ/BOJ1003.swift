//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/19.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var dp = [(Int, Int)](repeating: (0, 0), count: 41)
    dp[0] = (1, 0)
    dp[1] = (0, 1)
    if n > 1 {
        for idx in 2...n {
            dp[idx] = (dp[idx - 1].0 + dp[idx - 2].0, dp[idx - 1].1 + dp[idx - 2].1)
        }
    }
    print(dp[n].0, dp[n].1)
}
