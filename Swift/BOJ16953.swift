//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/23.
//

import Foundation

struct Queue {
    var queue: [(Int, Int)] = []
    var ptr = 0
    
    func isEmpty() -> Bool {
        if ptr >= queue.count {
            return true
        } else {
            return false
        }
    }
    
    mutating func push(_ n: (Int, Int)) {
        queue.append(n)
    }
    
    mutating func pop() -> (Int, Int) {
        let popped = queue[ptr]
        ptr += 1
        if ptr > 50000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return popped
    }
}

func bfs(_ start: Int) -> Int {
    var queue = Queue()
    queue.push((start, 0))
    isVisited[start] = true
    
    while !queue.isEmpty() {
        let node = queue.pop()
    
        if 2 * node.0 <= b && isVisited[2 * node.0] == nil {
            if 2 * node.0 == b {
                return node.1 + 2
            }
            isVisited[2 * node.0] = true
            queue.push((2 * node.0, node.1 + 1))
        }
        if node.0 * 10 + 1 <= b && isVisited[node.0 * 10 + 1] == nil {
            if node.0 * 10 + 1 == b {
                return node.1 + 2
            }
            isVisited[node.0 * 10 + 1] = true
            queue.push((node.0 * 10 + 1, node.1 + 1))
        }
    }
    return -1
}

let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b) = (ab[0], ab[1])
var isVisited: Dictionary<Int, Bool> = [:]

print(bfs(a))
