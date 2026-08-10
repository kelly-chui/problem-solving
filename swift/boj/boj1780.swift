//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/19.
//

import Foundation

func dividePaper(len: Int, row: Int, column: Int) {
    var n = len / 3
    var standard = paper[row][column]
    var isSame = true
    for r in row..<row + len where isSame {
        for c in column..<column + len where isSame{
            if paper[r][c] != standard {
                isSame = false
            }
        }
    }
    if isSame {
        if standard == -1 {
            minus += 1
        } else if standard == 0 {
            zero += 1
        } else {
            plus += 1
        }
        return
    }
    if len == 1 {
        return
    }
    
    dividePaper(len: n, row: row, column: column)
    dividePaper(len: n, row: row, column: column + n)
    dividePaper(len: n, row: row, column: column + n + n)
    dividePaper(len: n, row: row + n, column: column)
    dividePaper(len: n, row: row + n, column: column + n)
    dividePaper(len: n, row: row + n, column: column + n + n)
    dividePaper(len: n, row: row + n + n, column: column)
    dividePaper(len: n, row: row + n + n, column: column + n)
    dividePaper(len: n, row: row + n + n, column: column + n + n)
}

var n = Int(readLine()!)!
var paper: [[Int]] = []
var (minus, zero, plus) = (0, 0, 0)
for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
dividePaper(len: n, row: 0, column: 0)

print(minus)
print(zero)
print(plus)
