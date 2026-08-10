// https://leetcode.com/problems/smallest-divisible-digit-product-ii

class Solution {
    typealias FactorCount = (p2: Int, p3: Int, p5: Int, p7: Int)
    func minimumDigits(for factors: FactorCount) -> Int {
        var p2 = factors.p2
        var p3 = factors.p3
        var count = factors.p5 + factors.p7
        count += p2 / 3
        p2 %= 3
        count += p3 / 2
        p3 %= 2
        switch (p2, p3) {
        case (0, 0):
            break
        case (1, 0), (2, 0), (0, 1), (1, 1):
            count += 1
        case (2, 1):
            count += 2
        default:
            break
        }
        return count
    }
    func buildSuffix(for factors: FactorCount, slots: Int) -> String {
        var p2 = factors.p2
        var p3 = factors.p3
        var counts = [Int](repeating: 0, count: 10)
        counts[8] = p2 / 3
        p2 %= 3
        counts[9] = p3 / 2
        p3 %= 2
        switch (p2, p3) {
        case (0, 0):
            break
        case (1, 0):
            counts[2] += 1
        case (2, 0):
            counts[4] += 1
        case (0, 1):
            counts[3] += 1
        case (1, 1):
            counts[6] += 1
        case (2, 1):
            counts[2] += 1
            counts[6] += 1
        default:
            break
        }
        counts[5] = factors.p5
        counts[7] = factors.p7
        let neededSlots = counts.reduce(0) { $0 + $1 }
        counts[1] = slots - neededSlots
        var result = ""
        for digit in 1...9 {
            result += String(repeating: String(digit), count: counts[digit])
        }
        return result
    }
    func smallestNumber(_ num: String, _ t: Int) -> String {
        let digitFactors: [FactorCount] = [
            (0,0,0,0),
            (0,0,0,0),
            (1,0,0,0),
            (0,1,0,0),
            (2,0,0,0),
            (0,0,1,0),
            (1,1,0,0),
            (0,0,0,1),
            (3,0,0,0),
            (0,2,0,0)
        ]
        var targetFactors: FactorCount = (0, 0, 0, 0)
        var tempT = t
        for prime in [2, 3, 5, 7] {
            while tempT % prime == 0 {
                switch prime {
                case 2: targetFactors.p2 += 1
                case 3: targetFactors.p3 += 1
                case 5: targetFactors.p5 += 1
                case 7: targetFactors.p7 += 1
                default: break
                }
                tempT /= prime
            }
        }
        guard tempT <= 1 else { return "-1" }
        let digits = num.map { Int(String($0))! }
        var currentFactors: FactorCount = (0, 0, 0, 0)
        for digit in digits {
            let factor = digitFactors[digit]
            currentFactors.p2 += factor.p2
            currentFactors.p3 += factor.p3
            currentFactors.p5 += factor.p5
            currentFactors.p7 += factor.p7
        }
        if currentFactors.p2 >= targetFactors.p2 &&
           currentFactors.p3 >= targetFactors.p3 &&
           currentFactors.p5 >= targetFactors.p5 &&
           currentFactors.p7 >= targetFactors.p7 &&
           !digits.contains(0) {
            return num
        }
        let firstZero = digits.firstIndex(of: 0)
        var prefixFactors = currentFactors
        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            let currentDigit = digits[i]
            let current = digitFactors[currentDigit]
            prefixFactors.p2 -= current.p2
            prefixFactors.p3 -= current.p3
            prefixFactors.p5 -= current.p5
            prefixFactors.p7 -= current.p7
            if let firstZero, firstZero < i { continue }
            let remainingSlots = digits.count - i - 1
            if currentDigit < 9 {
                for candidate in (currentDigit + 1)...9 {
                    let candidateFactors = digitFactors[candidate]
                    let remaining: FactorCount = (
                        p2: max(0, targetFactors.p2 - prefixFactors.p2 - candidateFactors.p2),
                        p3: max(0, targetFactors.p3 - prefixFactors.p3 - candidateFactors.p3),
                        p5: max(0, targetFactors.p5 - prefixFactors.p5 - candidateFactors.p5),
                        p7: max(0, targetFactors.p7 - prefixFactors.p7 - candidateFactors.p7)
                    )
                    let neededSlots = minimumDigits(for: remaining)
                    if neededSlots <= remainingSlots {
                        let suffix = buildSuffix(
                            for: remaining,
                            slots: remainingSlots
                        )
                        let prefix = digits[..<i]
                            .map(String.init)
                            .joined()
                        return prefix + String(candidate) + suffix
                    }
                }
            }
        }
        let neededSlots = minimumDigits(for: targetFactors)
        let newLength = max(digits.count + 1, neededSlots)
        return buildSuffix(
            for: targetFactors,
            slots: newLength
        )
    }
}
