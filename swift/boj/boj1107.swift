//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/02/11.
//

import Foundation

func checkNumbers(_ num: Int) -> Bool {
    var temp = num
    repeat {
        if brokenButtons.contains(temp % 10) {
            return false
        } else {
            temp /= 10
        }
    } while temp > 0
    return true
}

let n = Int(String(readLine()!))!
let m = Int(String(readLine()!))!
var brokenButtons: [Int] = []
if m != 0 {
    brokenButtons = readLine()!.split(separator: " ").map{Int(String($0))!}
}
var answer: Int

if m == 10 {
  print(abs(n - 100))
} else if m != 0 {
    let max_count: Int = abs(n - 100)
    var tempChannel: Int = 0
    var count: Int = 0
    
    while count < max_count {
        if n - count >= 0 {
            if checkNumbers(n - count) {
                tempChannel = n - count
                break
            }
        }
        if checkNumbers(n + count) {
            tempChannel = n + count
            break
        }
        count += 1
    }
    print(String(tempChannel).count + count < abs(n - 100) ? String(tempChannel).count + count : abs(n - 100))
} else {
    print(abs(n - 100) > String(n).count ? String(n).count : abs(n - 100))
}
