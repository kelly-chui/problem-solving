//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/25.
//

func recursion(n: Int, rowStart: Int, columnStart: Int) -> String {
    let cut: Int = n / 2
    let temp = checkColor(n: n, rowStart: rowStart, columnStart: columnStart)
    
    if temp.0 {
        return String(temp.1)
    } else {
        let quadrant1 = recursion(n: cut, rowStart: rowStart, columnStart: columnStart)
        let quadrant2 = recursion(n: cut, rowStart: rowStart, columnStart: columnStart + cut)
        let quadrant3 = recursion(n: cut, rowStart: rowStart + cut, columnStart: columnStart)
        let quadrant4 = recursion(n: cut, rowStart: rowStart + cut, columnStart: columnStart + cut)
        return "(\(quadrant1)\(quadrant2)\(quadrant3)\(quadrant4))"
    }
}

func checkColor(n: Int, rowStart: Int, columnStart: Int) -> (Bool, Int) {
    let standardColor: Int = graph[rowStart][columnStart]
    for row in 0..<n {
        for column in 0..<n {
            if graph[rowStart + row][columnStart + column] != standardColor {
                return (false, -1)
            }
        }
    }
    return (true, standardColor)
}

var graph: [[Int]] = []
var answer: String = ""
let n = Int(readLine()!)!
for _ in 0..<n {
    graph.append(Array(readLine()!).map { Int(String($0))! })
}

print(recursion(n: n, rowStart: 0, columnStart: 0))
