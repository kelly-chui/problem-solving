import Foundation

let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let (v, e) = (ve[0], ve[1])
let initialValue = 987_654_321
var distances = [[Int]](repeating: [Int](repeating: initialValue, count: v + 1), count: v + 1)
for _ in 0..<e {
    let road = readLine()!.split(separator: " ").map { Int(String($0))! }
    distances[road[0]][road[1]] = road[2]
}
var answer = initialValue

for m in 1...v {
    for s in 1...v {
        for e in 1...v {
            distances[s][e] = min(distances[s][e], distances[s][m] + distances[m][e])
        }
    }
}

for s in 1...v {
    for e in 1...v {
        answer = min(answer, distances[s][e] + distances[e][s])
    }
}

print(answer == initialValue ? -1 : answer)
