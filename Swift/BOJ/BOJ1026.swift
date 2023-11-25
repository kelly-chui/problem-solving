import Foundation

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
var b = readLine()!.split(separator: " ").map { Int(String($0))! }
var s = 0
for (i, j) in zip(a.sorted { $0 < $1 }, b.sorted { $0 > $1 }) {
    s += i * j
}
print(s)
