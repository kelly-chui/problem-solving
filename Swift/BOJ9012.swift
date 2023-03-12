//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    var ps = Array(readLine()!).map{ String($0) }
    var count = 0
    while !ps.isEmpty {
        if ps.removeFirst() == "(" {
            count += 1
        } else {
            count -= 1
            if count < 0 {
                break
            }
        }
    }
    if count == 0 {
        print("YES")
    } else {
        print("NO")
    }
}
