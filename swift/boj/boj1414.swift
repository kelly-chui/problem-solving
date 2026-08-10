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
let alphabetDict = Dictionary(uniqueKeysWithValues: zip("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 1...52))
var parent = Array(0..<n)
var edges = [(Int, Int, Int)]()
var totalLength = 0

for i in 0..<n {
    let lines = Array(readLine()!)
    for j in 0..<lines.count {
        if lines[j] != "0" {
            edges.append((i, j, alphabetDict[lines[j]]!))
            totalLength += alphabetDict[lines[j]]!
        }
    }
}

edges.sort { $0.2 < $1.2 }

var length = 0
for edge in edges {
    if find(edge.0) != find(edge.1) {
        union(edge.0, edge.1)
        length += edge.2
    }
}

var answer = totalLength - length
for i in 0..<n {
    if find(0) != find(i) {
        answer = -1
        break
    }    
}

print(answer)

