//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/26.
//

import Foundation



let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var objects: [(weight: Int, value: Int)] = [(0, 0)]
for _ in 0..<nk[0] {
    let wv = readLine()!.split(separator: " ").map { Int(String($0))! }
    objects.append((wv[0], wv[1]))
}

var dpTable = [[Int]](repeating: [Int](repeating: 0, count: nk[1] + 1), count: nk[0] + 1)

for idx in 1...nk[0] {
    for weight in 1...nk[1] {
        if weight - objects[idx].weight >= 0 {
            dpTable[idx][weight] = max(dpTable[idx - 1][weight], dpTable[idx - 1][weight - objects[idx].weight] + objects[idx].value)
        } else {
            dpTable[idx][weight] = dpTable[idx - 1][weight]
        }
    }
}
print(dpTable[nk[0]][nk[1]])
