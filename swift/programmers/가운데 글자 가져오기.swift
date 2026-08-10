//
//  가운데 글자 가져오기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/07/27.
//

import Foundation

func solution(_ s:String) -> String {
    let arr = s.map {$0}
    if arr.count % 2 == 0 {
        return String(arr[(arr.count / 2) - 1]) + String(arr[arr.count / 2])
    } else {
        return String(arr[arr.count/2])
    }
}
