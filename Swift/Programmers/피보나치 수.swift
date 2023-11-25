//
//  피보나치 수.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/27.
//

func solution(_ n:Int) -> Int {
    var fibo: [Int] = [0, 1]
    for i in 2...n {
        fibo.append((fibo[i - 1] + fibo[i - 2]) % 1234567)
    }
    return fibo[n]
}
