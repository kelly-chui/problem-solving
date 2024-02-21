import Foundation

let mod = 1000000007
func getExpectedValue(_ n: Int, _ s: Int) -> Int {
    return s * getSquaredNumber(n, mod - 2) % mod
}

func getSquaredNumber(_ num: Int, _ exp: Int) -> Int {
    if exp == 1 {
        return num
    }

    if exp % 2 == 0 {
        let half = getSquaredNumber(num, exp/2)
        return half * half % mod
    } else {
        return num * getSquaredNumber(num, exp - 1) % X
    }
}

let M = Int(readLine()!)!
var sum = 0

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var (n, s) = (input[0], input[1])
    let gcd = n.gcd(s)
    n /= gcd
    s /= gcd

    sum += getExpectedValue(n, s)
    sum %= X
}

print(sum)