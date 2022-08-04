//
//  소수 찾기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/05.
//

func isPrime(_ a:Int) -> Bool {
    var j: Int = 2
    if a == 1 {
        return false
    } else {
        while(j * j <= a) {
            if a % j == 0 {
                return false
            }
            j += 1
        }
        return true
    }
}

func solution(_ n:Int) -> Int {
    var answer: Int = 0
    for i in 1...n {
        if isPrime(i) {
            answer += 1
        }
    }
    return answer
}
