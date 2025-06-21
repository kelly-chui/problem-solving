import Foundation

func IntPow(value: Int, n: Int) -> Int {
    guard n != 0 else { return 1 }
    return IntPow(value: value, n: n - 1) * value
}
func countOnes(n: Int, l: Int, r: Int, curL: Int, curR: Int) -> Int {
    if r < curL || l > curR { // 안겹침
        return 0
    }
    if l...r ~= curL && l...r ~= curR { // 겹침
        return IntPow(value: 4, n: n)
    }
    if n == 0 {
        return 1
    }
    
    let size = IntPow(value: 5, n: n - 1)
    var total = 0
    for i in 0..<5 {
        guard i != 2 else { continue }
        let subL = curL + size * i
        let subR = subL + size - 1
        total += countOnes(n: n - 1, l: l, r: r, curL: subL, curR: subR)
    }
    return total
}

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    let (n, l, r) = (Int(n), Int(l) - 1, Int(r) - 1)
    return countOnes(n: n, l: l, r: r, curL: 0, curR: IntPow(value: 5, n: n) - 1)
}
