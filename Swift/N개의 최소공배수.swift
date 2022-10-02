//
//  N개의 최소공배수.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/10/02.
//

func solution(_ arr:[Int]) -> Int {
    var lcm = arr[0]
    var gcd = 1
    
    for i in 1..<arr.count {
        var a = lcm
        var b = arr[i]
        while(true) {
            if a % b == 0 {
                gcd = b
                lcm = (lcm * arr[i]) / gcd
                break
            } else {
                let buf = a
                a = b
                b = buf % b
            }
        }
    }
    return lcm
}
