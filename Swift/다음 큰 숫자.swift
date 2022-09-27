//
//  ekdma zms tntwk.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/27.
//

import Foundation

func solution(_ n:Int) -> Int {
    var answer = n + 1
    var count = String(n, radix: 2).filter() { $0 == "1" }.count
    
    while(true) {
        var stringAns = String(answer, radix: 2)
        if stringAns.filter() { $0 == "1" }.count == count {
            return answer
        } else {
            answer += 1
        }
    }
}
