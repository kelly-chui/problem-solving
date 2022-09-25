//
//  크레인 인형뽑기 게임.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/25.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var newBoard = board
    var bucket: [Int] = []
    var count = 0
    for move in moves {
        for i in 0..<newBoard.count {
            if newBoard[i][move - 1] == 0 {
                continue
            } else {
                if bucket.count >= 1 {
                    if bucket.last! == newBoard[i][move - 1] {
                        bucket.popLast()
                        newBoard[i][move - 1] = 0
                        count += 2
                        break
                    } else {
                        bucket.append(newBoard[i][move - 1])
                        newBoard[i][move - 1] = 0
                        break
                    }
                } else {
                    bucket.append(newBoard[i][move - 1])
                    newBoard[i][move - 1] = 0
                    break
                }
            }
        }
    }
    return count
}
