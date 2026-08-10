//
//  3진법 뒤집기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

import Foundation

func solution(_ n:Int) -> Int {
    var temp = String(n, radix: 3)
    var returnValue = ""
    for i in temp.reversed() {
        returnValue += String(i)
    }
    return Int(returnValue, radix: 3)!
}
