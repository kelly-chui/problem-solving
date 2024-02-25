import Foundation

let mod: Int = 1000000007

func power(_ base: Int, _ exponent: Int) -> Int {
    var result = 1
    var base = base
    var exponent = exponent
    while exponent > 0 {
        if exponent & 1 == 1 {
            result = result * base % mod
        }
        exponent /= 2
        base = base * base % mod
    }
    return result
}


let m = Int(readLine()!)!
var ans = 0

for _ in 0..<m {
    let ns = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, s) = (ns[0], ns[1])
    ans += (s * power(n, mod - 2)) % mod
}

print(ans % mod)