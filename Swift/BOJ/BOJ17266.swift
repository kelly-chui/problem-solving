import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }

var answer = max(x.first!, n - x.last!)
for idx in 1..<m {
    let interval = Int(ceil(Double(x[idx] - x[idx - 1]) / 2.0))
    if interval > answer {
        answer = interval
    }
}
print(answer)