//
//  예상 대진표.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/10/03.
//

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var a_num = a
    var b_num = b
    var count = 0
    
    while a_num != b_num {
        if a_num % 2 == 1 {
            a_num = (a_num + 1) / 2
        } else {
            a_num = a_num / 2
        }
           
        if b_num % 2 == 1 {
            b_num = (b_num + 1)/2
        } else {
           b_num = b_num / 2
        }
        count += 1
    }
    return count
}
