//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/17.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var nameToIndex: Dictionary<String, Int> = [:]
var indexToName: Dictionary<Int, String> = [:]
var count = 1
for _ in 0..<nm[0] {
    let pokemon = readLine()!
    nameToIndex[pokemon] = count
    indexToName[count] = pokemon
    count += 1
}
for _ in 0..<nm[1] {
    let problem = readLine()!
    if let pokemonidx = Int(problem) {
        print(indexToName[pokemonidx]!)
    } else {
        print(nameToIndex[problem]!)
    }
}
