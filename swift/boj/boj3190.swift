//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/11.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var apples: [(Int, Int)] = []
for _ in 0..<k {
    let apple = readLine()!.split(separator: " ").map{ Int(String($0))! }
    apples.append((apple[0], apple[1]))
}
let l = Int(readLine()!)!
var commands: [(Int, String)] = []
for _ in 0..<l {
    let command = readLine()!.split(separator: " ")
    commands.append((Int(command[0])!, String(command[1])))
}
commands.sort(by: { $0.0 < $1.0 } )
var body: [(Int, Int)] = [(1, 1)]
var direction = (0, 1)
let moves = [(0, 1), (-1, 0), (0, -1), (1, 0)]
var tailPointer = 0
var commandPointer = 0
var count = 0

while true {
    let newLocation = (body.last!.0 + direction.0, body.last!.1 + direction.1)
    if newLocation.0 <= 0 || newLocation.0 > n || newLocation.1 <= 0 || newLocation.1 > n {
        print(count + 1)
        break
    }
    if body[tailPointer...].contains(where: { $0 == newLocation } ) {
        print(count + 1)
        break
    }
    body.append(newLocation)
    if !apples.contains(where: { $0 == newLocation } ) {
        tailPointer += 1
    } else {
        for idx in 0..<apples.count - 1 {
            if apples[idx] == newLocation {
                apples.remove(at: idx)
            }
        }
    }
    count += 1
    
    if count == commands[commandPointer].0 {
        if commands[commandPointer].1 == "L" {
            if direction == moves[0] {
                direction = moves[1]
            } else if direction == moves[1] {
                direction = moves[2]
            } else if direction == moves[2] {
                direction = moves[3]
            } else {
                direction = moves[0]
            }
        } else {
            if direction == moves[0] {
                direction = moves[3]
            } else if direction == moves[3] {
                direction = moves[2]
            } else if direction == moves[2] {
                direction = moves[1]
            } else {
                direction = moves[0]
            }
        }
        if commandPointer < commands.count - 1 {
            commandPointer += 1
        }
    }
}
