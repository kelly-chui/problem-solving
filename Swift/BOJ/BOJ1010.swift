import Foundation

func combination(n: Int, r: Int) -> Int {
    var result = 1.0
    for i in 1...r {
        result *= Double(n - i + 1) / Double(i)
    }
    return Int(result + 0.5)
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (nm[0], nm[1])
    print(combination(n: m, r: n))
}
