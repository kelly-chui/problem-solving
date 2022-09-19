//
//  행렬의 덧셈.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var returnValue = arr1
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            returnValue[i][j] += arr2[i][j]
        }
    }
    return returnValue
}
