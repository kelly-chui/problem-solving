//
//  하샤드 수.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ x:Int) -> Bool {
    let stringX = String(x)
    var sum: Int = 0
    for i in stringX {
        sum += Int(String(i))!
    }
    return x % sum == 0
