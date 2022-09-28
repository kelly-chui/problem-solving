//
//  카펫.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/28.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let area = brown + yellow
    var x: Int = 0
    var y: Int = 0
    for i in 1...area {
        if area % i == 0 {
            x = area / i
            y = i
        }
        if x + y == (brown / 2) + 2 {
            break
        }
    }
    return [x,y]
}
