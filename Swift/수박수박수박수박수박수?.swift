//
//  수박수박수박수박수박수?.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/05.
//

func solution(_ n:Int) -> String {
    var answer: String = ""
    for i in 1...n {
        if i % 2 == 1 {
            answer += "수"
        } else {
            answer += "박"
        }
    }
    return answer
}
