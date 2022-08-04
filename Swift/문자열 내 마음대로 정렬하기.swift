//
//  문자열 내 마음대로 정렬하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/04.
//

func solution(_ strings:[String], _ n:Int) -> [String] {
    let answer: [String] = strings.sorted()
    return answer.sorted(by: {$0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)]})
}
