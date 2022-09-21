//
//  실패율.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/21.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureRate: [Int: Double] = [:]
    var player: Int = stages.count
    
    for i in 1...N {
        let n = stages.filter { $0 == i }.count
        failureRate[i] = Double(n) / Double(player)
        player -= n
    }
    
    return failureRate.sorted(by: <).sorted(by: { $0.value > $1.value }).map {$0.key}
}
