//
//  부족한금액계산하기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/07/26.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int{
    var answer:Int
    var totalPrice: Int = 0
    
    for i in 1...count {
        totalPrice = totalPrice + (i * price)
    }
    
    answer = totalPrice - money
    
    if answer > 0 {
        return answer
    } else {
        return 0
    }
}
