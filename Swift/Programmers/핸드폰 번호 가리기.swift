//
//  핸드폰 번호 가리기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ phone_number:String) -> String {
    var returnValue: String = ""
    for i in 0 ..< phone_number.count - 4 {
        returnValue += "*"
    }
    returnValue = returnValue + phone_number.suffix(4)
    return returnValue
}
