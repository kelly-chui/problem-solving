import Foundation

let n = Int(readLine()!)!

var prevMax = readLine()!.split(separator: " ").map { Int($0)! }
var prevMin = prevMax

for _ in 1..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let currentMax = [
        line[0] + max(prevMax[0], prevMax[1]),
        line[1] + max(prevMax[0], prevMax[1], prevMax[2]),
        line[2] + max(prevMax[1], prevMax[2])
    ]
    let currentMin = [
        line[0] + min(prevMin[0], prevMin[1]),
        line[1] + min(prevMin[0], prevMin[1], prevMin[2]),
        line[2] + min(prevMin[1], prevMin[2])
    ]
    prevMax = currentMax
    prevMin = currentMin
}

print(prevMax.max()!, prevMin.min()!)