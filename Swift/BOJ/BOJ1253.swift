import Foundation

func binarySearch(_ x: Int, _ idx: [Int]) -> Bool {
    var low = 0
    var high = a.count
    while low < high {
        let mid = (high + low) / 2
        if a[mid] == x && !idx.contains(mid) {
            //print("\(a[idx[0]]) is Good, \(a[idx[1]]), \(a[mid])")
            return true
        }
        if a[mid] > x {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return false
}

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted { $0 < $1 }
var answer = 0
for i in 0..<a.count {
    for j in 0..<a.count {
        if i == j {
            continue
        }
        if binarySearch(a[i] - a[j], [i, j]) {
            answer += 1
            break
        }
    }
}

print(answer)
