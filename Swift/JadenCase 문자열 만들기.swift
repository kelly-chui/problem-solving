//
//  JadenCase 문자열 만들기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/26.
//

import Foundation
 
func solution(_ s:String) -> String {
    let words = s.lowercased().components(separatedBy: " ")
    var answer: [String] = []
    for w in words {
        var temp = Array(w)
        if temp.count > 0 && temp[0].isLetter {
            temp[0] = Character(String(temp[0]).uppercased())
        }
        var word = temp.map { String($0) }.joined()
        answer.append(word)
    }
    return answer.joined(separator: " ")
}

