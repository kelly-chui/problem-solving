//
//  2016년.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

func solution(_ a:Int, _ b:Int) -> String {
    let days = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var currentday = 0
    var returnValue = ""
    for i in 0..<a {
        currentday += days[i]
    }
    currentday += b
    switch currentday % 7 {
        case 1 : returnValue = "FRI"
        case 2 : returnValue = "SAT"
        case 3 : returnValue = "SUN"
        case 4 : returnValue = "MON"
        case 5 : returnValue = "TUE"
        case 6 : returnValue = "WED"
        default : returnValue = "THU"
    }
    return returnValue
}
