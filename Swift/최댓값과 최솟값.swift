//
//  최댓값과 최솟값.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/26.
//

func solution(_ s:String) -> String {
    var newS = s.components(separatedBy: " ").map() { Int($0)! }
    return String(newS.min()!) + " " + String(newS.max()!)
}
