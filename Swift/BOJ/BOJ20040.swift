//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2/22/23.
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
    if pa == pb {
        return
    }
    if rank[pa] > rank[pb] {
        parents[pb] = pa
    } else if rank[pb] < rank[pa] {
        parents[pa] = pb
    } else {
        parents[pb] = pa
        rank[pa] += 1
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var parents: Array<Int> = Array(0..<nm[0])
var rank: Array<Int> = [Int](repeating: 0, count: nm[0])
var answer: Int = 0

for i in 1...nm[1] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }
    if find(points[0]) == find(points[1]) {
        answer = i
        break
    } else {
        union(points[0], points[1])
    }
}

print(answer)
