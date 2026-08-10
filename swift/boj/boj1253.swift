import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted { $0 < $1 }
var answer = 0
for i in 0..<n {
    var start = 0
    var end = n - 1
    while start < end {
        if start == i {
            start += 1
            continue
        } 
        if end == i {
            end -= 1
            continue
        }
        if a[start] + a[end] == a[i] {
            answer += 1
            break
        } else if a[start] + a[end] > a[i] {
            end -= 1
        } else if a[start] + a[end] < a[i] {
            start += 1
        }
    }
}

print(answer)
