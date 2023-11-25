//
//  모의고사.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let supo1 = [1, 2, 3, 4, 5]
    let supo2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let supo3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var counts = [0, 0, 0]
    var returnValue: [Int] = []
    for i in 0..<answers.count {
        if answers[i] == supo1[i % 5] {
            counts[0] += 1
        }
        if answers[i] == supo2[i % 8] {
            counts[1] += 1
        }
        if answers[i] == supo3[i % 10] {
            counts[2] += 1
        }
    }
    for i in 0..<counts.count {
        if counts[i] == counts.max() {
            returnValue.append(i+1)
        }
    }
    return returnValue
}
