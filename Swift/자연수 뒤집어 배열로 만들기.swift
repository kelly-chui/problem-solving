//
//  자연수 뒤집어 배열로 만들기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/08.
//

func solution(_ n:Int64) -> [Int] {
    return String(n).map{Int(String($0))!}.reversed()
}
