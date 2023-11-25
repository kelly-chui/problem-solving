//
//  문자열 내림차순으로 배치하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/04.
//

func solution(_ s:String) -> String {
    return String(Array(s).sorted(by: {$0 > $1}))
}
