import Foundation

let n = Int(readLine()!)!
var relationships = [[Int]](repeating: [Int](repeating: 987_654_321, count: n), count: n)
for i in 0..<n {
    relationships[i][i] = 0
}
while true {
    let relation = readLine()!.split(separator: " ").map { Int(String($0))! }
    if relation == [-1, -1] {
        break
    }
    relationships[relation[0] - 1][relation[1] - 1] = 1
    relationships[relation[1] - 1][relation[0] - 1] = 1
}

for m in 0..<n {
    for s in 0..<n {
        for e in 0..<n {
            if relationships[s][e] > relationships[s][m] + relationships[m][e] {
                relationships[s][e] = relationships[s][m] + relationships[m][e]
                relationships[e][s] = relationships[s][e]
            }
        }
    }
}

var rank = [Int]()
var minRank = 987_654_321
var candidates = [Int]()
for member in relationships {
    rank.append(member.max()!)
    if member.max()! < minRank {
        minRank = member.max()!
    }
}
for i in 0..<rank.count {
    if rank[i] == minRank {
        candidates.append(i + 1)
    }
}

print(minRank, candidates.count)
for candidate in candidates.sorted { $0 < $1 } {
    print(candidate, terminator: " ")
}
