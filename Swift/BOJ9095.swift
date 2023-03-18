//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/18.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: 11)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    for idx in 4...10 {
        dp[idx] = dp[idx - 1] + dp[idx - 2] + dp[idx - 3]
    }
    print(dp[n])
}
