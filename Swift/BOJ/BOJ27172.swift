import Foundation

let n = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int(String($0))! }
var isExists = [Bool](repeating: false, count: 1_000_001)
var scores = [Int: Int]()
let maxCard = x.max()!
for card in x {
    isExists[card] = true
}

for card in x {
    var count = 2
    while card * count <= maxCard {
        if isExists[card * count] {
            scores[card, default: 0] += 1
            scores[card * count, default: 0] -= 1
        }
        count += 1
    }
}

x.forEach { print(scores[$0, default: 0], terminator: " ") }
print()
