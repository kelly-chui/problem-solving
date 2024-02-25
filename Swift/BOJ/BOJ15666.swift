import Foundation

func dfs(_ start: Int) {
    if answer.count == m {
        print(answer.map { String($0) }.joined(separator: " "))
        return
    }

    for element in start..<seq.count {
        answer.append(seq[element])
        dfs(element)
        answer.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var seq = Array(Set(readLine()!.split(separator: " ").map { Int(String($0))! }).sorted { $0 < $1 })
var answer = [Int]()

dfs(0)