import Foundation

let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map { Int(String($0))! }
var ps: [Int] = [0]
var minPs = 0
var answer = -1000
for i in 0..<seq.count {
    let psElement = ps.last! + seq[i]
    if psElement - minPs > answer {
        answer = psElement - minPs
    }
    ps.append(ps.last! + seq[i])
    if psElement < minPs {
        minPs = psElement
    }
}

print(answer)
