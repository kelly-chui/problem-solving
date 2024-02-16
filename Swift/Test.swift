let n = Int(readLine()!)!
let truncate = Int(Double(n) * 0.15 + 0.5)
var scores = [Int]()
for _ in 0..<n {
    scores.append(Int(readLine()!)!)
}
scores.sort { $0 < $1 }
var answer = 0
for score in truncate..<n - truncate {
    answer += scores[score]
}

print(Int(Double(answer) / Double(n - 2 * truncate) + 0.5))