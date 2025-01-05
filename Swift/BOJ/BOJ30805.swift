import Foundation

func recur() {
    
}

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = Int(readLine()!)!
var b = readLine()!.split(separator: " ").compactMap { Int($0) }

var answer = [Int]()
while a.count > 0 && b.count > 0 {
    let maxA = a.max()
    let maxB = b.max()
    
    guard let maxA = maxA,
          let maxB = maxB,
          let IndexA = a.firstIndex(of: maxA),
          let IndexB = b.firstIndex(of: maxB) else {
        break
    }

    if maxA == maxB {
        answer.append(maxA)
        a = Array(a[(IndexA + 1)...])
        b = Array(b[(IndexB + 1)...])
    } else if maxA > maxB {
        a.remove(at: IndexA)
    } else if maxA < maxB {
        b.remove(at: IndexB)
    }
}

print(answer.count)
for (idx, element) in answer.enumerated() where answer.count > 0 {
    print(element, terminator: idx == answer.count - 1 ? "\n" : " ")
}
