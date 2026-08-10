//
//  소수 만들기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/19.
//

import Foundation

func isPrime(num: Int) -> Bool {
    var j = 2
    while (j * j <= num) {
        if num % j == 0 {
            return false
        }
        j += 1
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    var sums: [Int] = []
    var dic: [Int: Bool] = [:]
    
    for i in 6...2997 {
        if isPrime(num: i) {
            dic.updateValue(true, forKey: i)
        } else {
            dic.updateValue(false, forKey: i)
        }
    }
    
    for i in 0..<nums.count - 2 {
        for j in i + 1..<nums.count - 1 {
            for k in j + 1..<nums.count {
                sums.append(nums[i] + nums[j] + nums[k])
            }
        }
    }
    for i in sums {
        if dic[i]! {
            answer += 1
        }
    }
    return answer
}
