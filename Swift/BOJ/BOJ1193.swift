import Foundation

var n = Int(readLine()!)!
var line = 1
var answer = (0, 0)

while n > line {
    n -= line
    line += 1
}

if line % 2 == 0 {
    answer.0 = n
    answer.1 = line + 1 - n
} else {
    answer.0 = line + 1 - n
    answer.1 = n
}

print("\(answer.0)/\(answer.1)")
