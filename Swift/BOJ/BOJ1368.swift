import Foundation

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let rootA = find(a)
    let rootB = find(b)
    if rootA < rootB {
        parent[rootB] = rootA
    } else {
        parent[rootA] = rootB
    }
}

let n = Int(readLine()!)!
let w = [Int]()
var edges = [(Int, Int, Int)]()
for i in 1...n {
    edges.append((0, i, Int(readLine()!)!))
}

for i in 1...n {
    let costs = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 1...n {
        edges.append((i, j, costs[j - 1]))
    }
}

var parent = Array(0...n)
var answer = 0

edges.sort { $0.2 < $1.2 }

for edge in edges {
    if find(edge.0) != find(edge.1) {
        union(edge.0, edge.1)
        answer += edge.2
    }
}

print(answer)