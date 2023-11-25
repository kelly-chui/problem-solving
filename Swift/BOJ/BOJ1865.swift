//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/25.
//

import Foundation

func bellmanFord(start: Int, n: Int, edges: [(Int, Int, Int)]) -> Bool {
    var distances = [Int](repeating: 999_999_999, count: n + 1)
    distances[start] = 0
    
    for i in 0..<n {
        for edge in edges {
            if distances[edge.1] > distances[edge.0] + edge.2 {
                distances[edge.1] = distances[edge.0] + edge.2
                if i == n - 1 {
                    return true
                }
            }
        }
    }
    return false
}

let tc = Int(readLine()!)!
for _ in 0..<tc {
    let nmw = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m, w) = (nmw[0], nmw[1], nmw[2])
    
    var edges: [(Int, Int, Int)] = []
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
        edges.append((edge[0], edge[1], edge[2]))
        edges.append((edge[1], edge[0], edge[2]))
    }
    
    for _ in 0..<w {
        let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
        edges.append((edge[0], edge[1], -1 * edge[2]))
    }
    print(bellmanFord(start: 1, n: n, edges: edges) ? "YES" : "NO")
}
