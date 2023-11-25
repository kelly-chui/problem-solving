//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/26.
//

import Foundation

let n = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var dpTable = graph

for layer in 0..<n {
    for idx in 0...layer {
        if layer == 0 {
            continue
        } else if idx == 0 || idx == layer {
            if idx == 0 {
                dpTable[layer][idx] += dpTable[layer - 1][idx]
            } else {
                dpTable[layer][idx] += dpTable[layer - 1][idx - 1]
            }
        } else {
            dpTable[layer][idx] = max(dpTable[layer][idx] + dpTable[layer - 1][idx], dpTable[layer][idx] + dpTable[layer - 1][idx - 1])
        }
    }
}

print(dpTable[n - 1].max()!)
