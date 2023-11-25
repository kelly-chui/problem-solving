//
//  약수의 합.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/05.
//

func solution(_ n:Int) -> Int {
    var divisors: [Int] = []
    var j: Int = 1
    var sum: Int = 0
    while (j * 2 <= n) {
        if n % j == 0 {
            divisors.append(j)
        }
        j += 1
    }
    
    for i in divisors {
        sum += i
    }
    return sum + n
}
