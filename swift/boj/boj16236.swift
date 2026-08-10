//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/11.
//

import Foundation

struct Queue {
    var queue: [(Int, Int, Int)] = []
    var pointer = 0
    func isEmpty() -> Bool {
        return pointer == queue.count ? true : false
    }
    
    mutating func push(_ value: (Int, Int, Int)) {
        queue.append(value)
    }
    
    mutating func pop() -> (Int, Int, Int) {
        let popped = queue[pointer]
        pointer += 1
        return popped
    }
}

func bfs(node: (Int, Int)) -> (Int, Int, Int) {
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    let moves = [(-1, 0), (0, -1), (0, 1), (1, 0)]
    var queue = Queue()
    queue.push((node.0, node.1, 0))
    isVisited[node.0][node.1] = true
    var min = 999_999_999
    var dists: [(Int, Int, Int)] = []
    while !queue.isEmpty() {
        let (row, column, dist) = queue.pop()
        for move in moves {
            let (newRow, newColumn) = (row + move.0, column + move.1)
            if (0 <= newRow && newRow < n) && (0 <= newColumn && newColumn < n) && !isVisited[newRow][newColumn] {
                if graph[newRow][newColumn] <= sharkSize {
                    isVisited[newRow][newColumn] = true
                    if 0 < graph[newRow][newColumn] && graph[newRow][newColumn] < sharkSize {
                        min = dist
                        dists.append((newRow, newColumn, dist + 1))
                    }
                    if dist + 1 <= min {
                        queue.push((newRow, newColumn, dist + 1))
                    }
                }
            }
        }
    }
    if !dists.isEmpty {
        dists.sort(by: { ($0.1 < $1.1) } )
        dists.sort(by: { ($0.0 < $1.0) } )
        dists.sort(by: { ($0.2 < $1.2) } )
        return dists[0]
    } else {
        return (-1, -1, -1)
    }
}

let n = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var sharkSize = 2
var start: (Int, Int) = (0, 0)
var count = 0
var fishCount = 0
var answer = 0

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] > 0 && graph[i][j] < 6 {
            fishCount += 1
        }
        if graph[i][j] == 9 {
            start = (i, j)
            graph[i][j] = 0
            break
        }
    }
}

while true {
    let result = bfs(node: start)
    if result == (-1, -1, -1) {
        break
    }
    start.0 = result.0
    start.1 = result.1
    answer += result.2
    count += 1
    fishCount -= 1
    if count == sharkSize {
        sharkSize += 1
        count = 0
    }
    graph[start.0][start.1] = 0
}

print(answer)
