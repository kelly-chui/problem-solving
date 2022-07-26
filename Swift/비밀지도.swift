//
//  비밀지도.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/07/27.
//

import Foundation

func convertDecToBin(n: Int, Dec: Int) -> [Int] {
    var value: Int = Dec
    var binaries: [Int] = []
    for i in (0 ..< n).reversed() {
        if value >= Int(pow(2.0, Float(i))) {
            binaries.append(1)
            value = value - Int(pow(2.0, Float(i)))
        } else {
            binaries.append(0)
        }
    }
    return binaries
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var arr1Bin: [[Int]] = []
    var arr2Bin: [[Int]] = []
    var temp: [Character]
    for i in (0 ..< n){
        arr1Bin.append(convertDecToBin(n: n, Dec: arr1[i]))
        arr2Bin.append(convertDecToBin(n: n, Dec: arr2[i]))
    }
    
    for i in (0 ..< n) {
        temp = []
        for j in (0 ..< n) {
            if arr1Bin[i][j] == 1 || arr2Bin[i][j] == 1 {
                temp.append("#")
            } else {
                temp.append(" ")
            }
        }
        answer.append(String(temp))
    }
    return answer
}


