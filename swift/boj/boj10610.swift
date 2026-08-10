import Foundation

let n = readLine()!.map { String($0) }
let sortedN = n.sorted(by: { $0 > $1 })
if sortedN.last! != "0" {
    print(-1)
    exit(0)
}
let intN = n.map { Int($0)! }
let sum = intN.reduce(0, { $0 + $1 })
if sum % 3 == 0 {
    print(sortedN.joined())
} else {
    print(-1)
}
