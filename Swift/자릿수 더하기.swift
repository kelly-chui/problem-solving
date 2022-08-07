//
//  자릿수 더하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/08.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer: Int = 0
    var i: Int = 100000000
    while(i >= 1) {
        answer = answer + ((n % (i * 10)) / i)
        i = i / 10
    }
    return answer
}
