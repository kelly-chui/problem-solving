//
//  성격 유형 검사하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/25.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var indicator: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    var answer = ""
    
    for i in 0..<survey.count {
        if choices[i] < 4 {
            indicator[String(survey[i].prefix(1))]! += 4 - choices[i]
        } else {
            indicator[String(survey[i].suffix(1))]! += choices[i] - 4
        }
    }
    
    if indicator["R"]! >= indicator["T"]! {
        answer += "R"
    } else {
        answer += "T"
    }
    if indicator["C"]! >= indicator["F"]! {
        answer += "C"
    } else {
        answer += "F"
    }
    if indicator["J"]! >= indicator["M"]! {
        answer += "J"
    } else {
        answer += "M"
    }
    if indicator["A"]! >= indicator["N"]! {
        answer += "A"
    } else {
        answer += "N"
    }
    return answer
}
