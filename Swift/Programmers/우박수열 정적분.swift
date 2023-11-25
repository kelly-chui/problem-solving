import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    func collatz(_ first: Int) -> [Int] {
        var collatzSeq: [Int] = [first]
        while collatzSeq.last! != 1 {
            if collatzSeq.last! % 2 == 0 {
                collatzSeq.append(collatzSeq.last! / 2)
            } else {
                collatzSeq.append(collatzSeq.last! * 3 + 1)
            }
        }
        return collatzSeq
    }
    
    func integral(_ start: Int , _ end: Int) -> Double {
        var area: Double = 0
        guard start + 1 <= collatzSeq.count + end else { return -1.0 }
        for idx in start + 1..<collatzSeq.count + end {
            area += Double(collatzSeq[idx] + collatzSeq[idx - 1]) / 2.0
        }
        return area
    }

    var collatzSeq: [Int] = collatz(k)
    var answer: [Double] = []
    for range in ranges {
        answer.append(integral(range[0], range[1]))
    }
    
    return answer
}
