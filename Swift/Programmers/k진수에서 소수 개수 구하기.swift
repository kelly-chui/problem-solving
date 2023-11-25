import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var pn = String(n, radix: k).split(separator: "0")
    var answer = 0
    
    for p in pn {
        var intP = Int(p)!
        var f = 2
        var isPrime = !(intP == 1)
        while f * f <= intP {
            if intP % f == 0 {
                isPrime = false
                break
            }
            f += 1
        }
        answer += isPrime ? 1 : 0
    }
    
    return answer
}
