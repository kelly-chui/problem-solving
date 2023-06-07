import Foundation

let n = Int(readLine()!)!
let roadLength = readLine()!.split(separator: " ").map { Int(String($0))! }
let oilPrice = readLine()!.split(separator: " ").map { Int(String($0))! }
var curPrice = 1_000_000_000
var answer = 0
for idx in 0..<n - 1 {
    curPrice = oilPrice[idx] < curPrice ? oilPrice[idx] : curPrice
    answer += curPrice * roadLength[idx]
}
print(answer)
