import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var answer: [String] = []
    var times: [(String, Int, Int)] = []
    for plan in plans {
        let time = plan[1].split(separator: ":").map { Int(String($0))! }
        times.append((plan[0], time[0] * 60 + time[1], Int(plan[2])!))
    }
    times.sort { $0.1 < $1.1 }
    var remainStack: [(String, Int)] = []
    
    for idx in 0..<times.count - 1 {
        let time = times[idx]
        print(time)
        if time.1 + time.2 > times[idx + 1].1 {
            remainStack.append((time.0, time.2 - (times[idx + 1].1 - time.1)))
        } else {
            answer.append(time.0)
            var remainTime = times[idx + 1].1 - (time.1 + time.2)
            if remainTime == 0 { continue }
            while remainTime > 0 && !remainStack.isEmpty {
                let lastIdx = remainStack.count - 1
                if remainTime >= remainStack[lastIdx].1 {
                    remainTime -= remainStack[lastIdx].1
                    answer.append(remainStack[lastIdx].0)
                    remainStack.removeLast()
                } else {
                    remainStack[lastIdx].1 -= remainTime
                    remainTime = 0
                }
            }
        }
    }
    answer += [times.last!.0]
    for r in remainStack.reversed() {
        answer += [r.0]
    }
    return answer
}
