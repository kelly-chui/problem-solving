//
//  직사각형 별찍기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for i in 0..<b {
    for j in 0..<a {
        print("*", terminator: "")
    }
    print("\n", terminator: "")
}
