//
//  키패드 누르기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/24.
//

import Foundation

func distance(_ position: [Int], _ currentKey: [Int]) -> Int {
    let dis = abs(position[0] - currentKey[0]) + abs(position[1] - currentKey[1])
    return dis
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var rightPosition: String = "#"
    var leftPosition: String = "*"
    var answer: String = ""
    let positionDic: [String: [Int]] = ["1": [0, 0], "2": [0, 1], "3": [0, 2],
                                       "4": [1, 0], "5": [1, 1], "6": [1, 2],
                                       "7": [2, 0], "8": [2, 1], "9": [2, 2],
                                       "*": [3, 0], "0": [3, 1], "#": [3, 2]]
    for i in numbers {
        if i == 1 || i == 4 || i == 7 {
            answer += "L"
            leftPosition = String(i)
        } else if i == 3 || i == 6 || i == 9 {
            answer += "R"
            rightPosition = String(i)
        } else if distance(positionDic[rightPosition]!, positionDic[String(i)]!) > distance(positionDic[leftPosition]!, positionDic[String(i)]!) {
            answer += "L"
            leftPosition = String(i)
        } else if distance(positionDic[rightPosition]!, positionDic[String(i)]!) < distance(positionDic[leftPosition]!, positionDic[String(i)]!) {
            answer += "R"
            rightPosition = String(i)
        } else {
            if hand == "right" {
                answer += "R"
                rightPosition = String(i)
            } else {
                answer += "L"
                leftPosition = String(i)
            }
        }
    }
    
    return answer
}
