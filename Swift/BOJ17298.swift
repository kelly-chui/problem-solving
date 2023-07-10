import Foundation

let n = Int(readLine()!)!
let a = Array(readLine()!.split(separator: " ").map { Int(String($0))! }.reversed())
var stack: [Int] = []
var answer: [Int] = []

for element in a {
    while !stack.isEmpty && stack.last! <= element {
        stack.removeLast()
    }
    if let last = stack.last {
        answer.append(last)
    } else {
        answer.append(-1)
    }
    stack.append(element)
}

print(answer.map { String($0) }.reversed().joined(separator: " "))
