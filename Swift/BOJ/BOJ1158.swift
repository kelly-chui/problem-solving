//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/05/18.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var table = Array(1...n)
var index = 0
print("<", terminator: "")
while !table.isEmpty {
    index += k
    index = index % table.count - 1
    if index == -1 { index = table.count - 1 }
    print(table[index], terminator: table.count == 1 ? ">\n" : ", ")
    table.remove(at: index)
}
