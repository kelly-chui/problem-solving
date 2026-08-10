//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/25.
//

import Foundation

func recursion(n: Int, paper: [[Int]]) {
    let temp: (Bool, Int) = checkColor(paper: paper)
    
    if temp.0 {
        if temp.1 == 0 {
            white += 1
        } else {
            blue += 1
        }
    } else {
        let cut: Int = n / 2
        recursion(n: cut, paper: paper[0..<cut].map { Array($0[0..<cut]) })
        recursion(n: cut, paper: paper[cut...].map { Array($0[0..<cut]) })
        recursion(n: cut, paper: paper[0..<cut].map { Array($0[cut...]) })
        recursion(n: cut, paper: paper[cut...].map { Array($0[cut...]) })
    }
}

func checkColor(paper: [[Int]]) -> (Bool, Int) {
    let standard: Int = paper[0][0]
    if paper.count != 0 {
        for row in paper {
            for color in row {
                if color != standard {
                    return (false, -1)
                }
            }
        }
    }
    return (true, standard)
}

var graph: [[Int]] = []
var white: Int = 0
var blue: Int = 0
let n = Int(readLine()!)!
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

recursion(n: n, paper: graph)

print(white)
print(blue)
