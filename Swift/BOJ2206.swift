//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/26.
//

import Foundation

struct Queue {
    var queue: [(Int, Int, Int)] = []
    var ptr = 0
    
    func isEmpty() -> Bool {
        return queue.count == ptr
    }
    
    mutating func push(_ value: (Int, Int, Int)) {
        queue.append(value)
    }
    
    mutating func pop() -> (Int, Int, Int) {
        let popped = queue[ptr]
        ptr += 1
        if ptr > 50000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return popped
    }
}

func bfs(_ start: (Int, Int, Int)) {
    let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var queue = Queue()
    queue.push(start)
    isVisited[0][0][0] = 1
    isVisited[0][0][1] = 1
    while !queue.isEmpty() {
        let (row, column, breaker) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            var newBreaker = breaker
            if (newRow, newColumn) == (n - 1, m - 1) {
                if newBreaker == 1 {
                    isPossible.1 = true
                } else {
                    isPossible.0 = true
                }
            }
            if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= m || (newRow, newColumn) == (0, 0){
                continue
            }
            if isVisited[newRow][newColumn][newBreaker] != 0 {
                continue
            }
            if graph[newRow][newColumn] == 1 {
                if breaker == 1 {
                    continue
                }
                else {
                    newBreaker = 1
                }
            }
            isVisited[newRow][newColumn][newBreaker] = isVisited[row][column][breaker] + 1
            queue.push((newRow, newColumn, newBreaker))
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph: [[Int]] = []
var isPossible: (Bool, Bool) = (false, false)
for _ in 0..<n {
    graph.append(Array(readLine()!).map { Int(String($0))! })
}

var isVisited = [[[Int]]](repeating: [[Int]](repeating: [0, 0], count: m), count: n)

bfs((0, 0, 0))

if isPossible == (true, true) {
    print(isVisited[n - 1][m - 1].min()!)
} else if isPossible == (false, true) {
    print(isVisited[n - 1][m - 1][1])
} else if isPossible == (true, false) {
    print(isVisited[n - 1][m - 1][0])
} else if isPossible == (false, false) {
    if (n, m) == (1, 1) {
        print(1)
    } else {
        print(-1)
    }
}
