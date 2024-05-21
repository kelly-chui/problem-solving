import Foundation

let ndkc = readLine()!.split(separator: " ").map { Int($0)! }
let (n, d, k, c) = (ndkc[0], ndkc[1], ndkc[2], ndkc[3])
var sushi = [Int]()

for _ in 0..<n {
    sushi.append(Int(readLine()!)!)
}

var types = Dictionary<Int, Int>()

for idx in 0..<k {
    types[sushi[idx], default: 0] += 1
}
types[c, default: 0] += 1

var maxCount = types.count

for idx in 0..<n {
    types[sushi[idx % n]]! -= 1
    if types[sushi[idx % n]]! == 0 {
        types[sushi[idx % n]] = nil
    }
    types[sushi[(idx + k) % n], default: 0] += 1
    maxCount = max(maxCount, types.count)
}

print(maxCount)
