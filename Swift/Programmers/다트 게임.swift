//
//  다트 게임.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/22.
//

func solution(_ dartResult:String) -> Int {
    var dartResults = dartResult
    var arrayResult = Array(dartResult).map() {String($0)}
    var bonuses: [String] = ["", "", ""]
    var rawScore: [Int] = []
    var score: Int = 0
    
    dartResults = dartResult.replacingOccurrences(of: "10", with: "A")
    arrayResult = Array(dartResults).map() {String($0)}
    
    var idx = -1
    for i in 0..<arrayResult.count {
        if arrayResult[i] == "A" {
            rawScore.append(10)
            idx += 1
        } else if let score = Int(arrayResult[i]) {
            rawScore.append(score)
            idx += 1
        } else if arrayResult[i] == "*" {
            rawScore[idx] *= 2
            if idx != 0 {
                rawScore[idx - 1] *= 2
            }
        } else {
            switch arrayResult[i] {
                case "S": rawScore[idx] *= 1
                case "D": rawScore[idx] = rawScore[idx] * rawScore[idx]
                case "T": rawScore[idx] = rawScore[idx] * rawScore[idx] * rawScore[idx]
                case "#": rawScore[idx] *= -1
                default : continue
            }
        }
    }
    
    return rawScore.reduce(0, +)
}
