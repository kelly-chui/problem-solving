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
    
    mutating func push(_ value: Int) {
        queue.append(value)
    }
    
    mutating func pop() -> Int {
        if queue[ptr...].count == 0 {
            return -1
        }
        let popped = queue[ptr]
        ptr += 1
        return popped
    }
    
    func size() -> Int {
        return queue[ptr...].count
    }
    
    func empty() -> Int {
        return queue[ptr...].isEmpty ? 1 : 0
    }
    
    func front() -> Int {
        if let front = queue[ptr...].first {
            return front
        } else {
            return -1
        }
    }
    
    func back() -> Int {
        if let back = queue[ptr...].last {
            return back
        } else {
            return -1
        }
    }
}

let n = Int(readLine()!)!
var queue = Queue()
for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { String($0) }
    switch command[0] {
    case "push":
        queue.push(Int(command[1])!)
    case "pop":
        print(queue.pop())
    case "size":
        print(queue.size())
    case "empty":
        print(queue.empty())
    case "front":
        print(queue.front())
    case "back":
        print(queue.back())
    default:
        break
    }
}
