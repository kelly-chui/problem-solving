//
//  콜라츠 추측.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ num:Int) -> Int {
    var returnNum = num
    var count: Int = 0
    while(true) {
        if returnNum == 1 || count == 500 {
            break
        } else if returnNum % 2 == 0 {
            returnNum /= 2
            count += 1
        } else {
            returnNum = returnNum * 3 + 1
            count += 1
        }
    }
    if count == 500 && returnNum != 1{
        return -1
    } else {
        return count
    }
}
