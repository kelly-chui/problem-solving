import Foundation

var strings = [String]()
var integers = [Int]()
for _ in 0..<3 {
    let str = readLine()!
    strings.append(str)
}

for (idx, str) in strings.enumerated() {
    if let num = Int(str) {
        switch idx {
        case 0: integers = [num, num + 1, num + 2]
        case 1: integers = [num - 1, num, num + 1]
        case 2: integers = [num - 2, num - 1, num]
        default: break
        }
    }
}

let nextStr = integers.last! + 1

if nextStr % 3 == 0 && nextStr % 5 == 0 {
    print("FizzBuzz")
} else if nextStr % 3 == 0 {
    print("Fizz")
} else if nextStr % 5 == 0 {
    print("Buzz")
} else {
    print(nextStr)
}