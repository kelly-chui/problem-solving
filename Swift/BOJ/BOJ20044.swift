import Foundation

let n = Int(readLine()!)!
let w = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }
var answer = Int.max
for idx in 0..<n {
    answer = min(answer, w[idx] + w[2 * n - 1 - idx])
}
print(answer)