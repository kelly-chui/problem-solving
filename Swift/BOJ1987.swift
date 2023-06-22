import Foundation

func dfs(currentLocation: (Int, Int), depth: Int, bitAlphabet: Int) {
    answer = max(answer, depth)
    for move in moves {
        let newLocation = (currentLocation.0 + move.0, currentLocation.1 + move.1)
        if newLocation.0 < 0 || newLocation.0 >= rc[0] || newLocation.1 < 0 || newLocation.1 >= rc[1] {
            continue
        }
        let n = 1 << newBoard[newLocation.0][newLocation.1]
        if bitAlphabet & n == 0 {
            dfs(currentLocation: newLocation, depth: depth + 1, bitAlphabet: bitAlphabet | n)
        }
    }
}

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
var board: [[String]] = []
for _ in 0..<rc[0] {
    board.append(readLine()!.map { String($0) })
}
var alphabetDict = [String: Int](uniqueKeysWithValues: zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0 ) }, 0...25))
let newBoard = board.map { $0.map { alphabetDict[$0]! } }
let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
var answer = 0
dfs(currentLocation: (0, 0), depth: 1, bitAlphabet: 1 << newBoard[0][0])
print(answer)
