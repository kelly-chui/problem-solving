//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/02/23.
//

import Foundation

func calDistance(_ a: [Double], _ b: [Double]) -> Double {
    return sqrt(pow(abs(a[0] - b[0]), 2) + pow(abs(a[1] - b[1]), 2))
}

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

let n = Int(readLine()!)!
var stars: [[Double]] = []
var edges: [(Int, Int, Double)] = []
var parent = Array(0..<n)
var answer: Double = 0

for i in 0..<n {
    stars.append(readLine()!.split(separator: " ").map { Double(String($0))! })
    for j in 0..<i {
        edges.append((i, j, calDistance(stars[i], stars[j])))
    }
}

edges.sort(by: { $0.2 < $1.2 })

for edge in edges {
    if find(edge.0) != find(edge.1) {
        union(edge.0, edge.1)
        answer += edge.2
    }
}

print(answer)
