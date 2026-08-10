import Foundation

let s = Int(readLine()!)!
var sum = 0
var count = 0
while sum <= s {
    count += 1
    sum += count
}
print(count - 1)
