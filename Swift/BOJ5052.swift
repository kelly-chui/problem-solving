import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var numbers: [String] = []
    var isConsistence = true
    
    for _ in 0..<n {
        numbers.append(readLine()!)
    }
    
    let newNumbers = numbers.sorted { $0 < $1 }
    
    for i in 0..<numbers.count - 1 {
        let current = Array(newNumbers[i])
        let next = Array(newNumbers[i + 1])
        if current.count <= next.count {
            if current == Array(next[0..<current.count]) {
                isConsistence = false
                break
            }
        }
    }
    print(isConsistence ? "YES" : "NO")
    
}
