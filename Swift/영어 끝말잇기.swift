//
//  영어 끝말잇기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/30.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var index = 0
    var pastwords: [String] = []
    var lastword = ""
    
    for i in 0..<words.count {
        if pastwords.contains(words[i]) {
            index = i + 1
            break
        }
        if lastword != "" {
            if lastword[lastword.index(before: lastword.endIndex)] != words[i][words[i].startIndex] {
                index = i + 1
                break
            }
        }
        pastwords.append(words[i])
        lastword = words[i]
    }
    if index == 0 {
        return [0, 0]
    }
    return [index % n == 0 ? n : index % n, Int(ceil(Double(index) / Double(n)))]
}
