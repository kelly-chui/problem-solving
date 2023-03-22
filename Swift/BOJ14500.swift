//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/22.
//

import Foundation

func dfs(len: Int, row: Int, column: Int, sum: Int) {
    if len == 4 {
        if sum > answer {
            answer = sum
        }
        return
    }
    
    for move in moves {
        let (newRow, newColumn) = (row + move.0, column + move.1)
        if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= m {
            continue
        }
        if isVisited[newRow][newColumn] {
            continue
        }
        isVisited[newRow][newColumn] = true
        dfs(len: len + 1, row: newRow, column: newColumn, sum: sum + paper[newRow][newColumn])
        if len == 2 {
            dfs(len: len + 1, row: row, column: column, sum: sum + paper[newRow][newColumn])
        }
        isVisited[newRow][newColumn] = false
        
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var paper: [[Int]] = []
for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var answer = 0

for row in 0..<n {
    for column in 0..<m {
        isVisited[row][column] = true
        dfs(len: 1, row: row, column: column, sum: paper[row][column])
        isVisited[row][column] = false
    }
}

print(answer)
