//
//  문자열 내 p와 y의 개수.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/04.
//

func solution1(_ s:String) -> Bool
{
    var p:Int = 0
    var y:Int = 0
    
    for i in s {
        switch i {
            case "p" : p += 1
            case "P" : p += 1
            case "y" : y += 1
            case "Y" : y += 1
            default : continue
        }
    }
    if p == y {
        return true
    } else {
        return false
    }
}
