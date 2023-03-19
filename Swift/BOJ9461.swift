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
    var dp = [Int](repeating: 0, count: 101)
    dp[1] = 1
    dp[2] = 1
    dp[3] = 1
    dp[4] = 2
    if n > 4 {
        for idx in 5...n {
            dp[idx] = dp[idx - 2] + dp[idx - 3]
        }
    }
    print(dp[n])
}
