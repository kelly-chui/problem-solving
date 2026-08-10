//
//  최대공약수와 최소공배수.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ n:Int, _ m:Int) -> [Int] {
    var a = n
    var b = m
    var gcd: Int = 1
    while(true) {
        if a % b == 0 {
            gcd = b
            break
        } else {
            let buf = a
            a = b
            b = buf % b
        }
    }
    
    return [gcd, n * m / gcd]
}
