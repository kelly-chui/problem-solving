//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/23.
//

import Foundation

func dfs(_ root: Int) -> Int {
    if tree[root].isEmpty {
        return 0
    }
    
    var childWeights: [Int] = [0]
    var first = 0
    var second = 0
    for child in tree[root] {
        var (node, weight) = child
        let newWeight = dfs(node) + weight
        childWeights.append(newWeight)
        if newWeight > first {
            second = first
            first = newWeight
        } else if newWeight > second {
            second = newWeight
        }
    }
    answer = max(first + second, answer)
    return childWeights.max()!
}

let n = Int(readLine()!)!
var tree = [[(child: Int, weight: Int)]](repeating: [], count: n + 1)
for _ in 0..<n - 1 {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (parent, child, weight) = (edge[0], edge[1], edge[2])
    tree[parent].append((child: child, weight: weight))
}
var answer = 0
dfs(1)
print(answer)
