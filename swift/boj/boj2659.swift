import Foundation

func dfs() {
    if seq.count == 4 {
        allClockNumbers.insert(findClockNumber(seq))
        return
    }

    for n in 1...9 {
        seq.append(n)
        dfs()
        seq.popLast()
    }
}

func findClockNumber(_ seq: [Int]) -> Int {
    var clockNumber = 10000
    for start in 0..<4 {
        var digit = 1000
        var tempNumber = 0
        for i in 0..<4 {
            tempNumber += seq[(start + i) % 4] * digit
            digit /= 10
        }
        clockNumber = min(tempNumber, clockNumber)
    }
    return clockNumber
}

var seq = [Int]()
var allClockNumbers = Set<Int>()
let input = readLine()!.split(separator: " ").map { Int($0)! }
dfs()
let clockNumber = findClockNumber(input)
let arrayAll = allClockNumbers.sorted { $0 < $1 }
for idx in 0..<arrayAll.count {
    if clockNumber == arrayAll[idx] {
        print(idx + 1)
    }
}
