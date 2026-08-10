//
//  두 정수 사이의 합.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/03.
//

func solution(_ a:Int, _ b:Int) -> Int64 {
    var first: Int
    var second: Int
    if b >= a {
        first = a
        second = b
    } else {
        first = b
        second = a
    }
    var amount : Int = second - first + 1
    var avg : Int64 = Int64((first + second) / 2)
    var sum : Int64 = Int64((amount / 2) * (first + second))
    if amount % 2 == 0 {
        return sum
    } else {
        return sum + avg
    }
}
