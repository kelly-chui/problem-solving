//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/08.
//

import Foundation

func normalBFS(node: (Int, Int), n: Int) {
    
    let moves: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var bfsQ: [(Int, Int)] = []
    bfsQ.append(node)
    isVisitedNormal[node.0][node.1] = true
    
    while !bfsQ.isEmpty {
        let node: (Int, Int) = bfsQ.removeFirst()
        for move in moves {
            let row = node.0 + move.0
            let column = node.1 + move.1
            if row < 0 || row >= n || column < 0 || column >= n {
                continue
            }
            if graph[node.0][node.1] == graph[row][column] && !isVisitedNormal[row][column] {
                bfsQ.append((row, column))
                isVisitedNormal[row][column] = true
            }
        }
    }
}

func colorBlindBFS(node: (Int, Int), n: Int) {
    
    let moves: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var bfsQ: [(Int, Int)] = []
    bfsQ.append(node)
    isVisitedCB[node.0][node.1] = true
    
    while !bfsQ.isEmpty {
        let node: (Int, Int) = bfsQ.removeFirst()
        for move in moves {
            let row = node.0 + move.0
            let column = node.1 + move.1
            if row < 0 || row >= n || column < 0 || column >= n {
                continue
            }
            if !isVisitedCB[row][column] {
                if graph[node.0][node.1] == Character("R") || graph[node.0][node.1] == Character("G") {
                    if graph[row][column] != Character("B") {
                        bfsQ.append((row, column))
                        isVisitedCB[row][column] = true
                    }
                } else if graph[node.0][node.1] == graph[row][column] {
                    bfsQ.append((row, column))
                    isVisitedCB[row][column] = true
                }
            }
        }
    }
}

let n = Int(readLine()!)!
var graph: [[Character]] = []
var isVisitedNormal: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var isVisitedCB: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var countNormal: Int = 0
var countCB: Int = 0

for _ in 0..<n {
    graph.append(String(readLine()!).map{($0)})
}

for row in 0..<n {
    for column in 0..<n {
        if !isVisitedNormal[row][column] {
            normalBFS(node: (row, column), n: n)
            countNormal += 1
        }
        if !isVisitedCB[row][column] {
            colorBlindBFS(node: (row, column), n: n)
            countCB += 1
        }
    }
}

print(countNormal, countCB)
