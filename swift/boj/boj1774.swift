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
        parent[pb] = pa
    } else {
        parent[pa] = pb
    }
}

func calDistance(_ a: [Int], _ b: [Int]) -> Double {
    return sqrt(pow(abs(Double(a[0] - b[0])), 2) + pow(abs(Double(a[1] - b[1])), 2))
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var aliens: [[Int]] = []
var parent = Array(0..<nm[0])
var edges: [[(Int, Int, Double)]] = []
var shortcuts: [[Int]] = []
var answer: Double = 0
for i in 0..<nm[0] {
    aliens.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    var temp: [(Int, Int, Double)] = []
    for j in 0..<i {
        temp.append((i, j, calDistance(aliens[i], aliens[j])))
    }
    edges.append(temp)
}
for _ in 0..<nm[1] {
    let shortcut = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    if shortcut[0] > shortcut[1] {
        edges[shortcut[0]][shortcut[1]].2 = 0
    } else {
        edges[shortcut[1]][shortcut[0]].2 = 0
    }
}

var flattenEdges = edges.flatMap{$0}
flattenEdges.sort(by: { $0.2 < $1.2 })

for edge in flattenEdges {
    if find(edge.0) != find(edge.1) {
        union(edge.0, edge.1)
        answer += edge.2
    }
}

print(String(format: "%.2f", answer))
