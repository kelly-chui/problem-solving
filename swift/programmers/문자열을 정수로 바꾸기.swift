//
//  문자열을 정수로 바꾸기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/05.
//

func solution(_ s:String) -> Int {
    var arrayS = Array(s)
    if arrayS[0] == "+" {
        return Int(String(arrayS[1...]))!
    } else if arrayS[0] == "+" {
        return Int(String(arrayS[1...]))!
    } else {
        return Int(s)!
    }
}
