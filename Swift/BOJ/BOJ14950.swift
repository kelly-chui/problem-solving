import Foundation

func find(_ a: Int) -> Int {
    if parents[a] != a {
        parents[a] = find(parents[a])
    }
    return parents[a]
}

func union(_ a: Int, _ b: Int) {
    let pa = find(a)
    let pb = find(b)
    
    if pa < pb {
        parents[pb] = pa
    } else {
        parents[pa] = pb
    }
}

let nmt = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, t) = (nmt[0], nmt[1], nmt[2])
var edges = [(Int, Int, Int)]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (input[0], input[1], input[2])
    edges.append((a, b, c))
}

var parents = Array(0...n + 1)
var tCount = 0
var answer = 0
edges.sort { $0.2 < $1.2 }

for edge in edges {
    if find(edge.0) != find(edge.1) {
        union(edge.0, edge.1)
        answer += (edge.2 + tCount * t)
        tCount += 1
    }
}

print(answer)