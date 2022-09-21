//
//  실패율.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/21.
//

import Foundation

func lowerBinarySearch(stages: [Int], target: Int) -> Int {
    var start = 0
    var end = stages.count - 1
    var mid = 0
    while start < end {
        mid = (start + end) / 2
        if stages[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    if end == stages.count - 1 && stages[end] < target  {
        return end + 1
    } else {
    return end
    }
}

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureRate: [Int: Double] = [:]
    var player: Int = stages.count
    var lowerBounds: [Int] = []
    var sortedArray = Array(Set(stages)).sorted()
    var sortedstages = stages.sorted()
    var playerNum: [Int] = []
    
    for i in 1...N + 1 {
        lowerBounds.append(lowerBinarySearch(stages: sortedstages, target: i))
    }
    for i in 0..<N + 1 {
        if i == N {
            playerNum.append(stages.count - lowerBounds[i])
            break;
        }
        playerNum.append(lowerBounds[i + 1] - lowerBounds[i])
    }
    
    for i in 1...N {
        failureRate[i] = Double(playerNum[i - 1]) / Double(player - lowerBounds[i - 1])
    }
    
    return failureRate.sorted(by: <).sorted(by: { $0.value > $1.value }).map {$0.key}
}
