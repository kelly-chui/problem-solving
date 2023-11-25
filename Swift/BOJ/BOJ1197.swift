//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/02/23.
//

import Foundation

func find(_ a: Int) -> Int {
    if parent[a] != a {
        parent[a] = find(parent[a])
    }
    return parent[a]
}

func union(_ a: Int, _ b: Int) {
    let pa = find(a)
    let pb = find(b)
    if pa < pb {
        parent[pb] = a
    } else {
        parent[pa] = b
    }
}
let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
var parent = Array(0..<ve[0] + 1)
var edges: Array<Array<Int>> = []
var answer: Int = 0

for _ in 0..<ve[1] {
    edges.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
edges.sort(by: { $0[2] < $1[2] })

for edge in edges {
    if find(edge[0]) != find(edge[1]) {
        union(edge[0], edge[1])
        answer += edge[2]
    }
}

print(answer)
