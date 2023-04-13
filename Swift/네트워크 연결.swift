import Foundation

func find(_ a: Int) -> Int {
    if parent[a] != a {
        parent[a] = find(parent[a])
    }
    return parent[a]
}

func union(_ a: Int, _ b: Int) {
    let pa = find(a)
    let pb = find(b)
    if pa < pb {
        parent[pb] = pa
    } else {
        parent[pa] = pb
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var edges: [(Int, Int, Int)] = []
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges.append((abc[0], abc[1], abc[2]))
    edges.append((abc[1], abc[0], abc[2]))
}
var parent = Array(0...1000)
edges.sort { $0.2 < $1.2 }

var answer = 0
for edge in edges {
    if find(edge.0) != find(edge.1) {
        union(edge.0, edge.1)
        answer += edge.2
    }
}

print(answer)
