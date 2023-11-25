import Foundation

let name = readLine()!.map { String($0) }
var dict = [String: Int]()
for n in name {
    dict[n, default: 0] += 1
}
var isPossible = 1
var answer = ""
var center = ""
for (key, value) in dict {
    if value % 2 == 1 {
        if isPossible == 0 {
            print("I'm Sorry Hansoo")
            exit(0)
        } else {
            dict[key]! -= 1
            isPossible -= 1
            center = String(key)
        }
    }
}
var newDict = dict.sorted { $0.key < $1.key }
for (key, value) in newDict {
    for _ in 0..<value / 2 {
        answer += String(key)
    }
}

print(answer + center + String(answer.reversed()))
