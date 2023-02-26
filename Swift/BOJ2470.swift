//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/26.
//

import Foundation

struct answer {
    var left = Int()
    var right = Int()
}

let n = Int(readLine()!)!
var solutions = readLine()!.split(separator: " ").map { Int(String($0))! }
var leftPtr = 0
var rightPtr = solutions.count - 1
var trait = 2_000_000_000
var ans = answer()

solutions.sort(by: { $0 < $1 })

while rightPtr > leftPtr {
    let temp = solutions[leftPtr] + solutions[rightPtr]
    if abs(temp) < trait {
        trait = abs(temp)
        ans.left = solutions[leftPtr]
        ans.right = solutions[rightPtr]
        if temp == 0 { break }
    }
    if temp > 0 {
        rightPtr -= 1
    } else {
        leftPtr += 1
    }
}

print(ans.left, ans.right)
