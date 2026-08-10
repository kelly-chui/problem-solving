//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/10.
//

import Foundation

func backTracking(_ idx: Int) {
    if chickenSeq.count == nm[1] { // 치킨집 선택 완료 했을 때
        var answer = 0
        for i in 0..<houses.count {
            var min: Int = 999_999_999
            for j in chickenSeq {
                min = distances[i][j] < min ? distances[i][j] : min
            }
            answer += min
        }
        answers.append(answer)
    }
    
    for i in idx..<chickens.count {
        chickenSeq.append(i)
        backTracking(i + 1)
        chickenSeq.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph: [[Int]] = []
for _ in 0..<nm[0] {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var houses: [(Int, Int)] = []
var chickens: [(Int, Int)] = []
var distances: [[Int]] = [] // row: house column: Chiken (row, Column): row house to column Chicken
var chickenSeq: [Int] = []
var answers: [Int] = []

for row in 0..<nm[0] {
    for column in 0..<nm[0] {
        if graph[row][column] == 1 {
            houses.append((row, column))
        } else if graph[row][column] == 2{
            chickens.append((row, column))
        }
    }
}

for house in houses {
    var temp: [Int] = []
    for chicken in chickens {
        temp.append(abs(house.0 - chicken.0) + abs(house.1 - chicken.1))
    }
    distances.append(temp)
}

backTracking(0)

print(answers.min()!)
