//
//  제일 작은 수 제거하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/18.
//

func solution(_ arr:[Int]) -> [Int] {
    let temp = arr.sorted()
    var tempArr = arr
    tempArr = tempArr.filter(){$0 != temp[0]}
    if tempArr.count == 0 {
        return [-1]
    } else {
        return tempArr
    }
}
