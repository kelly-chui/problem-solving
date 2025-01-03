import Foundation

func checkFruits() -> Bool {
    var sorts = 0
    for fruit in fruits {
        if fruit > 0 {
            sorts += 1
        }
        if sorts > 2 {
            return false
        }
    }
    return true
}

let n = Int(readLine()!)!
let s = readLine()!.split(separator: " ").compactMap { Int($0) }
var fruits = [Int](repeating: 0, count: 10)
var (start, end) = (0, 0)
var answer = 1

fruits[s[start]] += 1

while end < n {
    if checkFruits() {
        end += 1
        fruits[s[end]] += 1
    } else {
        fruits[s[start]] -= 1
        start += 1
    }
    if checkFruits() {
        answer = max(answer, end - start + 1)
    }
}
print(answer)
