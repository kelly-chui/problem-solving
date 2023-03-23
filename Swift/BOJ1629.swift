//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/22.
//

import Foundation

func recur(_ b: Int) -> Int {
    if b == 1 {
        return a
    }
    
    if b == 2 {
        return (a * a) % c
    }
    
    let temp = recur(b / 2) % c
    if b % 2 == 0 {
        return (temp * temp) % c
    } else {
        return (((temp * temp) % c) * a) % c
    }
}

let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b, c) = (abc[0] % abc[2], abc[1], abc[2])

print(recur(b))
