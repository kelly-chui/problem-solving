let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var names = [String]()
for _ in 0..<n {
    names.append(readLine()!)
}
var answer = 0

var window = [Int](repeating: 0, count: 21)
for idx in 0..<n {
    if idx > k {
        let startLength = names[idx - k - 1].count
        window[startLength] -= 1
    }
    let nameLength = names[idx].count
    answer += window[nameLength]
    window[nameLength] += 1
}
print(answer)
