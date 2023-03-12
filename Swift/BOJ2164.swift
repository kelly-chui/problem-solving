//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/12.
//

import Foundation

struct Queue {
    var queue: [Int] = []
    var ptr = 0
    
    func size() -> Int {
        return queue[ptr...].count
    }
    
    mutating func push(_ value: Int) {
        queue.append(value)
    }
    
    mutating func pop() -> Int {
        var popped = queue[ptr]
        ptr += 1
        if ptr > 500 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return popped
    }
}

let n = Int(readLine()!)!

var deck = Array(1...n)
var queue = Queue()
queue.queue = deck

while true {
    if n == 1 {
        print(1)
        break
    }
    queue.pop()
    if queue.size() == 1 {
        print(queue.pop())
        break
    }
    queue.push(queue.pop())
    if queue.size() == 1 {
        print(queue.pop())
        break
    }
}
