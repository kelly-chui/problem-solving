let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, newScore, p) = (input[0], input[1], input[2])
var scoreBoard = [Int]()
if n != 0 {
    scoreBoard = readLine()!.split(separator: " ").map { Int($0)! }
}

var minRank = n + 1
var maxRank = n + 1
for idx in 0..<n {
    if newScore >= scoreBoard[idx] {
        minRank = idx + 1
        break
    }
}

for idx in 0..<n {
    if newScore > scoreBoard[idx] {
        maxRank = idx + 1
        break
    }
}

if maxRank <= p {
    print(minRank)
} else {
    print(-1)
}