import Foundation

let a = Array(readLine()!)
let b = Array(readLine()!)
var dpTable = [[Int]](repeating: [Int](repeating: 0, count: b.count + 1), count: a.count + 1)

for i in 1...a.count {
    for j in 1...b.count {
        if a[i - 1] == b[j - 1] {
            dpTable[i][j] = dpTable[i - 1][j - 1] + 1
        } else {
            dpTable[i][j] = max(dpTable[i - 1][j], dpTable[i][j - 1]) 
        }
    }
}

var lcs = ""
var (i, j) = (a.count, b.count)
while i > 0 && j > 0 {
    if a[i - 1] == b[j - 1] {
        lcs.append(a[i - 1])
        i -= 1
        j -= 1
    } else if dpTable[i - 1][j] > dpTable[i][j - 1] {
        i -= 1
    } else {
        j -= 1
    }
}
print(lcs.count)
if lcs.count > 0 {
    print(String(lcs.reversed()))
}
