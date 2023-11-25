import Foundation

let str = readLine()!.map { String($0) }
let ppap = ["P", "P", "A", "P"]
var stack: [String] = []
for char in str {
    stack.append(char)
    if Array(stack.suffix(4)) == ppap {
        stack.removeLast(3)
    }
}
print(stack.joined() == "P" || stack.joined() == "PPAP" ? "PPAP" : "NP")
