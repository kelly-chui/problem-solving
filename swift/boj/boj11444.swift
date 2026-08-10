//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/28.
//

import Foundation

func squreMatrix(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2)
    for i in 0..<2 {
        for j in 0..<2 {
            for k in 0..<2 {
                result[i][j] += mat1[i][k] * mat2[k][j] % 1_000_000_007
            }
        }
    }
    return result
}

func recur(_ a: [[Int]], _ b: Int) -> [[Int]] {
    if b == 1 {
        return a
    } else {
        var buffer = recur(a, b / 2)
        return b % 2 == 0 ? squreMatrix(buffer, buffer) : squreMatrix(squreMatrix(buffer, buffer), a)
    }
}

let n = Int(readLine()!)!

print(recur([[1, 1], [1, 0]], n)[0][1] % 1_000_000_007)
