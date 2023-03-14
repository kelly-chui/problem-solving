//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/14.
//

import Foundation

func z(_ n: Int, _ row: Int, _ column: Int) -> Int {
    if n == 0 {
        return 0
    }
    return 2 * (row % 2) + (column % 2) + 4 * z(n - 1, row / 2, column / 2)
}

let nrc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, r, c) = (nrc[0], nrc[1], nrc[2])
print(z(n, r, c))
