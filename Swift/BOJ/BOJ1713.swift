import Foundation

let n = Int(readLine()!)!
let voteCount = Int(readLine()!)!
var votes = readLine()!.split(separator: " ").map { Int($0)! }
var dict = [Int: (Int, Int)]()
var frame = [Int]()

for idx in 0..<votes.count {
    dict[votes[idx], default: (0, 0)].0 += 1
    if !frame.contains(votes[idx]) {
        if frame.count == n {
            dict[frame.removeLast()] = (0, 0)
        }
        frame.append(votes[idx])
        dict[votes[idx]]!.1 = idx
    }
    frame.sort {
        let a = dict[$0]!
        let b = dict[$1]!
        if a.0 != b.0 {
            return a.0 > b.0
        } else {
            return a.1 > b.1
        }
    }
}

frame.sorted { $0 < $1 }.forEach { print($0, terminator: " ") }
