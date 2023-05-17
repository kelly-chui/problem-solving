import Foundation

let n = Int(readLine()!)!
var company: Dictionary<String, Bool> = [:]
var answer: [String] = []

for _ in 0..<n {
    let stats = readLine()!.split(separator: " ").map { String($0) }
    if stats[1] == "enter" {
        company[stats[0]] = true
    } else {
        company[stats[0]] = nil
    }
}

for (key, _) in company {
    answer.append(key)
}
for name in answer.sorted(by: { $0 > $1 }) {
    print(name)
}
