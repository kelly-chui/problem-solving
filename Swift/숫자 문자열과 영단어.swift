//
//  숫자 문자열과 영단어.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

import Foundation

func solution(_ s:String) -> Int {
    var returnValue = s
    let dic = ["zero" : "0",
              "one" : "1",
              "two" : "2",
              "three" : "3",
              "four" : "4",
              "five" : "5",
              "six" : "6",
              "seven" : "7",
              "eight" : "8",
              "nine" : "9"]
    for (key, value) in dic {
        returnValue = returnValue.replacingOccurrences(of: key, with: value)
    }
    return Int(returnValue)!
}
