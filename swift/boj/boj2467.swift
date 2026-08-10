import Foundation

let n = Int(readLine()!)!
let sols = readLine()!.split(separator: " ").map { Int(String($0))! }
var (low, high) = (0, n - 1)
var (sol1, sol2) = (sols[low], sols[high])
var value = abs(sol1 + sol2)

while low < high {
    let currentValue = sols[low] + sols[high]
    if abs(currentValue) < value {
        value = abs(currentValue)
        (sol1, sol2) = (sols[low], sols[high])
    }
    if currentValue < 0 {
        low += 1
    } else if currentValue > 0 {
        high -= 1
    } else { 
        break
    }
}
print(sol1, sol2)
