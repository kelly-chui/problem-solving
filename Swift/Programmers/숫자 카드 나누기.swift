import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    func gcd(_ a: Int, _ b: Int) -> Int {
        b == 0 ? a : gcd(b, a % b)
    }
    
    var answer = 0
    var gcdA = arrayA.first!
    var gcdB = arrayB.first!
    
    for i in 0..<arrayA.count {
        gcdA = gcd(gcdA, arrayA[i])
        gcdB = gcd(gcdB, arrayB[i])
    }
    
    if arrayA.filter({ $0 % gcdB == 0 }).count == 0 {
        answer = gcdB
    }
    if arrayB.filter({ $0 % gcdA == 0 }).count == 0 {
        answer = max(answer, gcdA)
    }
    
    return answer
}
