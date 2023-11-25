//
//  나누어 떨어지는 숫자 배열.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/02.
//

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var returnArray: [Int] = []
    for i in arr.sorted() {
        if i % divisor == 0 {
            returnArray.append(i)
        }
    }
    
    if returnArray.count == 0 {
        return [-1]
    } else {
        return returnArray
    }
}
