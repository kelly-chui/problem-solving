//
//  없는 숫자 더하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    var numbersArr: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    for i in numbers {
        numbersArr = numbersArr.filter() { $0 != i }
    }
    return numbersArr.reduce(0) { $0 + $1 }
}
