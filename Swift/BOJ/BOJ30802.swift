import Foundation

let n = Int(readLine()!)!
let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let tp = readLine()!.split(separator: " ").compactMap { Int($0) }
let (t, p) = (tp[0], tp[1])
var (answer1, answer2, answer3) = (0, 0, 0)

for s in size {
    if s % t == 0 {
        answer1 += (s / t)
    } else {
        answer1 += (s / t) + 1
    }
}
answer2 = n / p
answer3 = n % p
print("\(answer1)\n\(answer2) \(answer3)")
