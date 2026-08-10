//
//  이진 변환 반복하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/27.
//

import Foundation

func binaryTrans(_ num: String) -> (String, Int) {
    var n = Array(num)
    var count = 0
    var zeroCount = 0
    for i in n {
        if String(i) == "1" {
            count += 1
        } else {
            zeroCount += 1
        }
    }
    return (String(count, radix: 2), zeroCount)
}

func solution(_ s:String) -> [Int] {
    var count = 0
    var i = s
    var whileCount = 0
    while(i != "1") {
        var temp = binaryTrans(i)
        i = temp.0
        count += temp.1
        whileCount += 1
    }
    return [whileCount, count]
}
