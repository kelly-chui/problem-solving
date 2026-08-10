//
//  짝지어 제거하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/30.
//

import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var arrayS = Array(s)
    var answerStack: [Character] = []
    
    for i in arrayS {
        if answerStack.last == i {
            answerStack.popLast()
        } else {
            answerStack.append(i)
        }
    }
    return answerStack.isEmpty ? 1 : 0
}
