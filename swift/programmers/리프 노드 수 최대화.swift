// https://school.programmers.co.kr/learn/courses/30/lessons/468372

func solution(_ distLimit: Int, _ splitLimit: Int) -> Int {
    var cases: [(pow2: Int, pow3: Int)] = []
    var p2 = 1
    
    while p2 <= splitLimit {
        var p3 = 1
        while p2 * p3 <= splitLimit {
            cases.append((p2, p3))
            p3 *= 3
        }
        p2 *= 2
    }
    
    var answer = 1
    for (p2, p3) in cases {
        let leafCount = p2 * p3
        let distCount = (p2 - 1) + (p2 * (p3 - 1) / 2)
        guard distCount <= distLimit else { continue }
        let remainingDistCount = distLimit - distCount
        var candidate = leafCount
        let count = min(leafCount, remainingDistCount)
        if leafCount <= splitLimit / 3 {
            candidate += count * 2
        } else if leafCount <= splitLimit / 2 {
            candidate += count
        }
        answer = max(answer, candidate)
    }
    
    return answer
}
