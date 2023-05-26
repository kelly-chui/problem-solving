import Foundation


let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var s = Set<String>()
var answer = 0
for _ in 0..<nm[0] {
    s.insert(readLine()!)
}
for _ in 0..<nm[1] {
    let str = readLine()!
    if s.contains(str) {
        answer += 1
    }
}
print(answer)

