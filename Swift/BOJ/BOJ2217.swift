import Foundation

let n = Int(readLine()!)!
var ropes: [Int] = []
var answer = 0
var minRope = 10_000
var ropeCount = 0
for _ in 0..<n {
    ropes.append(Int(readLine()!)!)
}
ropes.sort { $0 > $1 }
for rope in ropes {
    ropeCount += 1
    minRope = min(rope, minRope)
    answer = max(minRope * ropeCount, answer)
}
print(answer)
