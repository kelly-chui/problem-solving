//
//  평균 구하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/15.
//

func solution(_ arr:[Int]) -> Double {
    return Double((arr.reduce(0,+))) / Double(arr.count)
}
