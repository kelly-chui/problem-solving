// https://school.programmers.co.kr/learn/courses/30/lessons/468371

import Foundation

func solution(_ signals: [[Int]]) -> Int {
    func isYellow(_ t: Int, _ signal: [Int]) -> Bool {
        let green = signal[0], yellow = signal[1]
        let cycle = signal[0] + signal[1] + signal[2]
        let pos = (t - 1) % cycle
        return pos >= green && pos < green + yellow
    }
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a / gcd(a, b) * b
    }
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
    
    let limit = signals.reduce(1) { lcm($0, $0 + $1[1] + $1[2]) }
    let cycleLCM = signals.reduce(1) { lcm($0, $1[0] + $1[1] + $1[2]) }
    
    for t in 1...cycleLCM {
        if signals.allSatisfy({ isYellow(t, $0) }) {
            return t
        }
    }
    
    return -1
}
