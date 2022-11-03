//
//  행렬의 곱셈.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/11/04.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var ans: [[Int]] = []
    var sum = 0
    for i in 0..<arr1.count {
        ans.append([])
        for j in 0..<arr2[0].count {
            for k in 0..<arr2.count {
                sum += arr1[i][k] * arr2[k][j]
            }
            ans[i].append(sum)
            sum = 0
        }
    }
    
    return ans
}
