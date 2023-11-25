//
//  최소직사각형.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var varSizes = sizes
    var buf = 0
    var temp = [0, 0]
    for i in 0 ..< varSizes.count {
        if varSizes[i][1] > varSizes[i][0] {
            buf = varSizes[i][1]
            varSizes[i][1] = varSizes[i][0]
            varSizes[i][0] = buf
        }
        if temp[0] < varSizes[i][0] {
            temp[0] = varSizes[i][0]
        }
        if temp[1] < varSizes[i][1] {
            temp[1] = varSizes[i][1]
        }
    }
    return temp[0] * temp[1]
}
