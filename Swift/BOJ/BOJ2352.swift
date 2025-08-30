// 오함
func lowerBound(_ arr: [Int], _ target: Int) -> Int {
    var low = 0
    var high = arr.count
    while low < high {
        let mid = (low + high) / 2
        if arr[mid] < target {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return low
}
let n = Int(readLine()!)!
let ports = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int]()
for port in ports {
    let idx = lowerBound(dp, port)
    if idx == dp.count {
        dp.append(port)
    } else {
        dp[idx] = port
    }
}
print(dp.count)
