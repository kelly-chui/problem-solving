//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/19.
//

import Foundation

func dfs(start: Int) {
    for node in graph[start] {
        if !isVisited[node] {
            isVisited[node] = true
            dfs(start: node)
        }
    }
}
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [], count: n + 1)
var isVisited = [Bool](repeating: false, count: n + 1)
for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    graph[u].append(v)
    graph[v].append(u)
}
var answer = 0

for idx in 1...n {
    if !isVisited[idx] {
        isVisited[idx] = true
        dfs(start: idx)
        answer += 1
    }
}

print(answer)
