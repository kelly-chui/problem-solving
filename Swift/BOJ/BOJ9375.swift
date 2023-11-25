//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/15.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    var dict: Dictionary<String, Int> = [:]
    var array = [Int](repeating: 0, count: 31)
    let n = Int(readLine()!)!
    var count = 0
    for _ in 0..<n {
        let wear = readLine()!.split(separator: " ").map { String($0) }
        if dict[wear[1]] == nil {
            dict[wear[1]] = count
            count += 1
        }
        array[dict[wear[1]]!] += 1
    }
    var answer = 1
    var idx = 0
    while array[idx] != 0 {
        answer *= (array[idx] + 1)
        idx += 1
    }
    print(answer - 1)
}
