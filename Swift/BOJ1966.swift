//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let priorities = readLine()!.split(separator: " ").map { Int(String($0))! }
    var answer = 0
    var queue: [(Int, Bool)] = []
    for i in 0..<priorities.count {
        if i == nm[1] {
            queue.append((priorities[i], true))
        } else {
            queue.append((priorities[i], false))
        }
    }
    
    while !queue.isEmpty {
        let popped = queue.first!
        var isMax = true
        
        for element in queue {
            if element.0 > popped.0 {
                queue.append(queue.removeFirst())
                isMax = false
                break
            }
        }
        
        if isMax {
            if popped.1 {
                print(answer + 1)
                break
            } else {
                queue.removeFirst()
                answer += 1
            }
        }
    }
}
