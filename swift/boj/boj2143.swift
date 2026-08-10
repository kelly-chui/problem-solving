import Foundation

let t = Int(readLine()!)!
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map { Int(String($0))! }
var partialSumsA = [a[0]]
var partialSumsB = [b[0]]
var aDict: [Int: Int] = [a[0]: 1]
var bDict: [Int: Int] = [b[0]: 1]
var answer = 0

for end in 1..<n {
    partialSumsA.append(partialSumsA[end - 1] + a[end])
    aDict[partialSumsA[end], default: 0] += 1
    for start in 0..<end {
        aDict[partialSumsA[end] - partialSumsA[start], default: 0] += 1
    }
}
for end in 1..<m {
    partialSumsB.append(partialSumsB[end - 1] + b[end])
    bDict[partialSumsB[end], default: 0] += 1
    for start in 0..<end {
        bDict[partialSumsB[end] - partialSumsB[start], default: 0] += 1
    }
}
let arrayA = aDict.map { $0.key }.sorted { $0 < $1 }
let arrayB = bDict.map { $0.key }.sorted { $0 < $1 }

for sumA in arrayA {
    let aCount = aDict[sumA]!
    if let bCount = bDict[t - sumA] {
        answer += (aCount * bCount)
    }
}

print(answer)
