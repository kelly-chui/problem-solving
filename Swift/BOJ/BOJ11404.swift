//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/25.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var distances = [[Int]](repeating: [Int](repeating: 999_999_999, count: n + 1), count: n + 1)
for _ in 0..<m {
    let path = readLine()!.split(separator: " ").map { Int(String($0))! }
    if distances[path[0]][path[1]] > path[2] {
        distances[path[0]][path[1]] = path[2]
    }
}

for idx in 0...n {
    distances[idx][idx] = 0
}

for m in 1...n {
    for a in 1...n {
        for b in 1...n {
            if distances[a][b] > distances[a][m] + distances[m][b] {
                distances[a][b] = distances[a][m] + distances[m][b]
            }
        }
    }
}

for distance in distances[1...] {
    distance[1...].map { print($0 >= 999_999_999 ? 0 : $0, terminator: " ") }
    print()
}
