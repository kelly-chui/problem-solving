import Foundation

func bellmanFord(_ root: Int) -> Bool {
    distance[root] = 0
    for v in 1...n + 1 {
        for e in 0..<m {
            let (currentCity, nextCity, cost) = edges[e]
            if distance[currentCity] == initialDist { continue }
            if distance[nextCity] > distance[currentCity] + cost {
                if v != n + 1 {
                    distance[nextCity] = distance[currentCity] + cost
                } else {
                    return true
                }
            }
        }
    }
    return false
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let initialDist = 987_654_321
var edges = [(Int, Int, Int)]()
var distance = [Int](repeating: initialDist, count: n + 1)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let edge = (abc[0], abc[1], abc[2])
    edges.append(edge)
}

if bellmanFord(1) {
    print(-1)
} else {
    for city in 2...n {
        print(distance[city] != initialDist ? distance[city]: -1)
    }
}
