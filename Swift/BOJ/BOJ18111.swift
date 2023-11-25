//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let nmb = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmb[0]
let m = nmb[1]
let b = nmb[2]
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var min = 999_999_999
var answer = 0

for height in 0...256 {
    var count = 0
    var inventory = b
    for row in 0..<n {
        for column in 0..<m {
            if graph[row][column] < height {
                inventory -= height - graph[row][column]
                count += height - graph[row][column]
            } else {
                inventory += graph[row][column] - height
                count += (graph[row][column] - height) * 2
            }
        }
    }
    if inventory < 0 { continue }
    if min >= count {
        min = count
        answer = height
    }
}

print(min, answer)
