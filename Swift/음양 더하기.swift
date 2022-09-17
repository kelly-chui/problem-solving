//
//  음양 더하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    for i in 0 ..< absolutes.count {
        if signs[i] {
            sum = sum + absolutes[i]
        } else {
            sum = sum - absolutes[i]
        }
    }
    return sum
}
