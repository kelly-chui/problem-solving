//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/27.
//

import Foundation

func dfs(_ node: Int, _ dist: Int) {
    if isVisited[node] {
        return
    }
    
    isVisited[node] = true
    if maxDist < dist {
        maxDist = dist
        maxNode = node
    }
    
    for adj in tree[node] {
        dfs(adj.0, dist + adj.1)
    }
}

let v = Int(readLine()!)!
var tree = [[(Int, Int)]](repeating: [], count: v + 1)
for _ in 0..<v {
    let edges = readLine()!.split(separator: " ").map { Int(String($0))! }
    var n = 1
    while edges[n] != -1 {
        tree[edges[0]].append((edges[n], edges[n + 1]))
        tree[edges[n]].append((edges[0], edges[n + 1]))
        n += 2
    }
}
var isVisited = [Bool](repeating: false, count: v + 1)
var (maxNode, maxDist) = (0, 0)
var start = 1

dfs(start, 0)
isVisited = [Bool](repeating: false, count: v + 1)
start = maxNode
maxNode = 0
maxDist = 0
dfs(start, 0)
print(maxDist)
