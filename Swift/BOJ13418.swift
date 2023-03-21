//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/19.
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

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var roads: [(from: Int, to: Int, weight: Int)] = []
for _ in 0..<nm[1] + 1 {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    roads.append((from: abc[0], to: abc[1], weight: abc[2]))
    roads.append((from: abc[1], to: abc[0], weight: abc[2]))
}
var parent = Array(0...nm[0])
var (easy, hard) = (0, 0)

roads.sort { $0.weight > $1.weight }

for road in roads {
    if find(road.to) != find(road.from) {
        union(road.to, road.from)
        if road.weight == 0 {
            easy += 1
        }
    }
}

parent = Array(0...nm[0])

for road in roads.reversed() {
    if find(road.to) != find(road.from) {
        union(road.to, road.from)
        if road.weight == 0 {
            hard += 1
        }
    }
}

print((hard * hard) - (easy * easy))
