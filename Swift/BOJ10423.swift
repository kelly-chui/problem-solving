//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/06.
//

import Foundation

func find(_ a: Int) -> Int {
    if parents[a] != a {
        parents[a] = find(parents[a])
    }
    return parents[a]
}

func union(_ a: Int, _ b: Int) {
    let pa = find(a)
    let pb = find(b)
    
    if pa < pb {
        parents[pb] = pa
    } else {
        parents[pa] = pb
    }
}

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let plants = readLine()!.split(separator: " ").map { Int(String($0))! }
var isPlants = [Bool](repeating: false, count: nmk[0] + 1)
var parents = Array(0...nmk[0])
for plant in plants {
    isPlants[plant] = true
}
var edges: [(u: Int, v: Int, w: Int)] = []
for _ in 0..<nmk[1] {
    let uvw = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u = isPlants[uvw[0]] ? 0 : uvw[0]
    let v = isPlants[uvw[1]] ? 0 : uvw[1]
    let w = uvw[2]
    edges.append((u: u, v: v, w: w))
}
var answer = 0

edges.sort(by: { $0.w < $1.w } )

for edge in edges {
    if find(edge.u) != find(edge.v) {
        union(edge.u, edge.v)
        answer += edge.w
    }
}

print(answer)
