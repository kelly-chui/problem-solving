//
//  두 개 뽑아서 더하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var tempValues: [Int] = []
    var sets: Set<Int>
    var returnValues: [Int]
    for i in 0..<numbers.count {
        for j in 0..<numbers.count {
            if i == j {
                continue
            }
            tempValues.append(numbers[i] + numbers[j])
        }
    }
    sets = Set(tempValues)
    returnValues = Array(sets)
    return returnValues.sorted()
}
