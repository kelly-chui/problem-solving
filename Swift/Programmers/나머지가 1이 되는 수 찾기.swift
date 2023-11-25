//
//  나머지가 1이 되는 수 찾기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/07/26.
//

import Foundation

func solution(_ n:Int) -> Int {
    var x : Int = 1;
    
    while(n % x != 1){
        x = x + 1;
    }
    
    return x
}
