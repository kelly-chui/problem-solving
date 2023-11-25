//
//  문자열 다루기 기본.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/04.
//

func solution(_ s:String) -> Bool {
    return !(s.count == 4 || s.count == 6) ? false : Int(s) == nil ? false : true
}
