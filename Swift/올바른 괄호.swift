//
//  올바른 괄호.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/27.
//

import Foundation

func solution(_ s:String) -> Bool {
    var count = 0
    for i in s {
        if count < 0 {
            return false
        }
        if String(i) == "(" {
            count += 1
        } else if String(i) == ")" {
            count -= 1
        }
    }
    if count == 0 {
        return true
    } else {
        return false
    }
}
