//
//  로또의 최고 순위와 최저 순위.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/22.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var count = 0
    var zerocount = 0
    for i in lottos {
        if i == 0 {
            zerocount += 1
            continue
        }
        for j in win_nums {
            if i == j {
                count += 1
            }
        }
    }
    var highRank = 7 - (zerocount + count)
    var lowRank = 7 - count
    if lowRank >= 7 {
        lowRank = 6
    }
    if highRank >= 7 {
        highRank = 6
    }
    return [highRank, lowRank]
}
