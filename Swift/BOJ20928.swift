import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let p = readLine()!.split(separator: " ").map { Int(String($0))! }
let x = readLine()!.split(separator: " ").map { Int(String($0))! }

var current = 0
var answer = 0
var isAnswered = false

while true {
    let limit = p[current] + x[current]
    if limit >= nm[1] {
        print(answer)
        isAnswered = true
        break
    }
    var max = 0
    var stop = true
    
    for idx in current + 1..<nm[0] {
        if p[idx] > limit {
            break
        }
        if max < p[idx] + x[idx] {
            max = p[idx] + x[idx]
            current = idx
            stop = false
        }
    }
    
    if stop {
        break
    } else {
        answer += 1
    }
}

if !isAnswered {
    if p[current] + x[current] >= nm[1] {
        print(answer)
    } else {
        print(-1)
    }
}
