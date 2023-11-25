//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let n = Int(readLine()!)!
var data: [(Int, String)] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    data.append((Int(input[0])!, input[1]))
}

for datum in data.sorted(by: { $0.0 < $1.0 }) {
    print(datum.0, datum.1)
}
