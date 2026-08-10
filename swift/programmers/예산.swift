//
//  예산.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sum: Int = 0
    var count: Int = 0
    var sortedArray = d.sorted()
    
    while sum <= budget {
        if sum == budget {
            break
        }
        if count >= sortedArray.count {
            break
        }
        sum += sortedArray[count]
        if sum > budget {
            break
        }
        count += 1
    }
    
    return count
}
