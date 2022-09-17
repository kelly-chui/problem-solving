//
//  x만큼 간격이 있는 n개의 숫자.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ x:Int, _ n:Int) -> [Int64] {
    var returnValue: [Int64] = []
    for i in 0..<n {
        returnValue.append(Int64(x) * Int64(i + 1))
    }
    return returnValue
}
