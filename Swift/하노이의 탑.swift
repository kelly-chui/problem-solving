import Foundation

func solution(_ n:Int) -> [[Int]] {
    func hanoi(n: Int, start: Int, mid: Int, dest: Int) {
        if n == 1 {
            answer.append([start, dest])
            return
        }
        hanoi(n: n - 1, start: start, mid: dest, dest: mid)
        answer.append([start, dest])
        hanoi(n: n - 1, start: mid, mid: start, dest: dest)
    }
    
    var answer: [[Int]] = []
    hanoi(n: n, start: 1, mid: 2, dest: 3)
    
    return answer
}
