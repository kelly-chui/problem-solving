import Foundation

let n = Int(readLine()!)!
var dpTable = [Int](repeating: 0, count: n + 1)
dpTable[0] = 1
if n >= 2 {
    dpTable[2] = 3
}

if n >= 4 {
    for i in 3...n {
        if i % 2 == 1 {
            continue
        }
        for j in 0...i - 2 {
            if j == i - 2 {
                dpTable[i] += dpTable[j] * 3
                continue
            }
            dpTable[i] += dpTable[j] * 2
        }
    }
}
print(dpTable[n])