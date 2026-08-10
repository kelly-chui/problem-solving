//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/25.
//

import Foundation

func recursion(b: Int) -> [[Int]] {
    if b == 1 {
        return matrix
    } else {
        var tempMatrix = recursion(b: b / 2)
        tempMatrix = matrixProduct(matrix1: tempMatrix, matrix2: tempMatrix)
        if b % 2 == 1 {
            tempMatrix = matrixProduct(matrix1: tempMatrix, matrix2: matrix)
        }
        return tempMatrix
    }
}

func matrixProduct(matrix1: [[Int]], matrix2: [[Int]]) -> [[Int]] {
    var squareMatrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for row in 0..<n {
        for column in 0..<n {
            for i in 0..<n {
                squareMatrix[row][column] += matrix1[row][i] * matrix2[i][column]
                squareMatrix[row][column] %= 1000
            }
        }
    }
    return squareMatrix
}

let nb = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nb[0]
let b = nb[1]
var matrix: [[Int]] = []
for _ in 0..<nb[0] {
    matrix.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var answer: [[Int]] = recursion(b: b)
for row in answer {
    for column in row {
        print(column % 1000, terminator: " ")
    }
    print()
}
