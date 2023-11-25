//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/06.
//

import Foundation

func find(_ a: Int) -> Int{
    if parents[a] != a {
        parents[a] = find(parents[a])
    }
    return parents[a]
}

func union(_ a: Int, _ b: Int) {
    let pa = parents[a]
    let pb = parents[b]
    if pa < pb {
        parents[pb] = pa
    } else {
        parents[pa] = pb
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let sex = readLine()!.split(separator: " ").map { String($0) }
var edges: [(u: Int, v: Int, d: Int)] = []
for _ in 0..<nm[1] {
    let uvd = readLine()!.split(separator: " ").map { Int(String($0))! }
    if sex[uvd[0] - 1] != sex[uvd[1] - 1] {
        edges.append((u: uvd[0], v: uvd[1], d: uvd[2]))
    }
}
var parents = Array(0...nm[0])
var count = 0
var answer = 0

edges.sort(by: { $0.d < $1.d } )

for edge in edges {
    if find(edge.u) != find(edge.v) {
        union(edge.u, edge.v)
        answer += edge.d
        count += 1
    }
}

print(count == nm[0] - 1 ? answer : -1)
