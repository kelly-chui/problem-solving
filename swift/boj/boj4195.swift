//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/02/22.
//

import Foundation

func union(_ a: Int, _ b: Int) -> Int {
    let pa = find(a)
    let pb = find(b)
    if pa == pb {
        return pa
    }
    if ranks[pa] > ranks[pb] {
        parents[pa] += parents[pb]
        parents[pb] = pa
        return pa
    } else if ranks[pa] < ranks[pb] {
        parents[pb] += parents[pa]
        parents[pa] = pb
        return pb
    } else {
        parents[pa] += parents[pb]
        parents[pb] = pa
        ranks[pa] += 1
        return pa
    }
}

func find(_ a: Int) -> Int {
    if parents[a] > -1 {
        parents[a] = find(parents[a])
    } else {
        return a
    }
    return parents[a]
}

let t: Int = Int(readLine()!)!
var dict: Dictionary<String, Int> = [:]
var parents: Array<Int> = []
var ranks: Array<Int> = []

for _ in 0..<t {
    let f: Int = Int(readLine()!)!
    var count = 0
    for _ in 0..<f {
        let names = readLine()!.components(separatedBy: " ")
        for name in names {
            if dict[name] == nil {
                dict[name] = count
                parents.append(-1)
                ranks.append(0)
                count += 1
            }
        }
        print(parents[union(dict[names[0]]!, dict[names[1]]!)] * -1)
    }
    dict = [:]
    parents = []
    ranks = []
}
