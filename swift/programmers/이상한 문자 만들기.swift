//
//  이상한 문자 만들기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/08.
//

func solution(_ s:String) -> String {
    var words: [String]
    var answer: String = ""
    var temp: String = ""
    words = s.components(separatedBy: [" "])
    for idx in words {
        for (i, char) in idx.enumerated() {
            if i % 2 == 0 {
                temp = temp + char.uppercased()
            } else {
                temp = temp + char.lowercased()
            }
        }
        answer = answer + temp + " "
        temp = ""
    }
    
    return String(Array(answer).dropLast())
}
