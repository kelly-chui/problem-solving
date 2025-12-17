func lowerBound(low: Int, high: Int) -> Int {
    var low = low
    var high = high
    while low < high {
        let mid = (low + high) / 2
        if check(timeLimit: mid) {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return high
}
func check(timeLimit: Int) -> Bool {
    var passCount = 0
    for tk in t {
        passCount += (timeLimit / tk)
        if passCount >= m {
            return true
        }
    }
    return false
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var t = [Int]()
for _ in 0..<n {
    t.append(Int(readLine()!)!)
}

print(lowerBound(low: 0, high: t.min()! * m))
