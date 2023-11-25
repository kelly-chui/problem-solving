//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/03.
//

import Foundation

var n = Array(readLine()!).map { Int(String($0))! }
n.sorted(by: {$0 > $1}).forEach {
    print($0, terminator: "")
}
