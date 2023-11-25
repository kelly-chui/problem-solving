//
//  내적.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum = 0
    for i in 0 ..< a.count {
        sum = sum + a[i] * b[i]
    }
    return sum
}
