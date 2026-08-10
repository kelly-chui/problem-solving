import Foundation

let n = Int(readLine()!)!
let towers = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack: [Int] = []
var answer: [Int] = []
for towerIdx in 0..<towers.count {
    while !stack.isEmpty && towers[stack.last!] < towers[towerIdx] {
        stack.removeLast()
    }
    if let top = stack.last {
        answer.append(top + 1)
    } else {
        answer.append(0)
    }
    stack.append(towerIdx)
}
for answerIdx in 0..<answer.count {
    print(answer[answerIdx], terminator: answerIdx == answer.count - 1 ? "\n" : " ")
}
