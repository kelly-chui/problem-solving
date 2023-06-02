import Foundation

var arrangement = readLine()!
var stack: [Character] = []
var answer = 0
var lastChar = Character(" ")
for char in arrangement {
    if char == Character("(") {
        stack.append(char)
    } else if lastChar == Character("(") {
        stack.removeLast()
        answer += stack.count
    } else {
        stack.removeLast()
        answer += 1
    }
    lastChar = char
}

print(answer)
