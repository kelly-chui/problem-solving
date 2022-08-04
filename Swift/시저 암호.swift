//
//  시저 암호.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/05.
//

func solution(_ s:String, _ n:Int) -> String {
    var answer: String = ""
    for i in s {
        if i == " " {
            answer += " "
        } else if i <= "Z" {
            if Int(i.asciiValue!) + n > Int(Character("Z").asciiValue!) {
                answer = answer + String(UnicodeScalar(Int(i.asciiValue!) + n - 26)!)
            } else {
                answer = answer + String(UnicodeScalar(Int(i.asciiValue!) + n)!)
            }
        } else if i <= "z" && i >= "a" {
            if Int(i.asciiValue!) + n > Int(Character("z").asciiValue!) {
                answer = answer + String(UnicodeScalar(Int(i.asciiValue!) + n - 26)!)
            } else {
                answer = answer + String(UnicodeScalar(Int(i.asciiValue!) + n)!)
            }
        }
    }
    return answer
}
