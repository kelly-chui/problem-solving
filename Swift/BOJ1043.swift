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
    if ranks[pa] > ranks[pb] {
        parents[pb] = pa
    } else if ranks[pa] < ranks[pb] {
        parents[pa] = pb
    } else {
        parents[pb] = pa
        ranks[pa] += 1
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let trues = readLine()!.split(separator: " ").map { Int(String($0))! }

var parents = Array(0...nm[0])
var ranks = Array<Int>(repeating: 0, count: nm[0] + 1)
var parties: Array<Array<Int>> = []
var answer: Int = 0

for _ in 0..<nm[1] {
    parties.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

if trues[0] != 0 {
    let trueMember = trues[1]
    for member in trues[1...] {
        union(trueMember, member)
    }
    
    for party in parties {
        for member in party[1...] {
            union(party[1], member)
        }
    }
    
    for party in parties {
        var add = 1
        for member in party[1...] {
            if find(trueMember) == find(member) {
                add = 0
                break
            }
        }
        answer += add
    }
    
} else {
    answer = nm[1]
}

print(answer)
