//
//  정수 내림차순으로 배치하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ n:Int64) -> Int64 {
    var stringN = String(n)
    var temp: [Int64] = []
    var returnValue: String = ""
    for i in stringN {
        temp.append(Int64(String(i))!)
    }
    temp.sort(by:>)
    for i in temp {
        returnValue.append(String(i))
    }
    return Int64(returnValue)!
}
