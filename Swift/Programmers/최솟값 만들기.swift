//
//  최솟값 만들기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/27.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var arrA = A.sorted()
    var arrB = B.sorted() { $0 > $1 }
    var count = 0
    for i in 0..<arrA.count {
        count += arrA[i] * arrB[i]
    }
    
    return count
}
