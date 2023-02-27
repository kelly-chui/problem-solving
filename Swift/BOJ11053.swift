//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/27.
//

import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
var order = [Int](repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if a[i] > a[j] && order[j] >= order[i] {
            order[i] = order[j] + 1
        }
    }
}
print(order.max()!)
