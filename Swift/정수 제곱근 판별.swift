//
//  정수 제곱근 판별.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/16.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    return sqrt(Double(n)).truncatingRemainder(dividingBy:1.0) == 0.0 ? Int64((sqrt(Double(n)) + 1.0) * (sqrt(Double(n)) + 1.0)) : -1
}
