//
//  Fly me to the Alpha Centauri.swift
//  algorithm
//
//  Created by KellyChui on 2023/04/19.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    let answer = 2.0 * sqrt(Double(xy[1] - xy[0]))
    print(Double(Int(answer)) == answer ? Int(answer) - 1 : Int(answer))
}
