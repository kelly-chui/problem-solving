//
//  신규 아이디 추천.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/25.
//

import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id.lowercased()
    print(id)
    
    id = id.components(separatedBy: ["~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "]", "{", "}", ":", "?", ",", "<", ">", "/"]).joined()
    print(id)
    
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    print(id)
    
    if id.prefix(1) == "." {
        id = String(id.dropFirst(1))
    }
    if id.suffix(1) == "." {
        id = String(id.dropLast(1))
    }
    print(id)
    
    if id.isEmpty {
        id += "a"
    }
    print(id)
    
    if id.length >= 16 {
        id = String(id.dropLast(id.length - 15))
        if id.suffix(1) == "." {
            id = String(id.dropLast(1))
        }
    }
    print(id)
    
    while id.length <= 2 {
        id += id.suffix(1)
    }
    print(id)
    
    return id
}
