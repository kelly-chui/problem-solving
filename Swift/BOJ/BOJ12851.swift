import Foundation

struct Queue {
    var queue = [(Int, Int)]()
    var ptr = 0
    var isEmpty: Bool { ptr >= queue.count }
    
    mutating func push(_ v: (Int, Int)) {
        queue.append(v)
    }
    mutating func pop() -> (Int, Int) {
        let firstValue = queue[ptr]
        ptr += 1
        if ptr > 50000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return firstValue
    }
}

func bfs(_ start: Int) {
    var queue = Queue()
    var isVisited = Set<Int>()
    queue.push((start, 0))

    while !queue.isEmpty {
        let (cur, time) = queue.pop()
        isVisited.insert(cur)
        if answer.1 > 0 && cur == k && answer.0 == time {
            answer.1 += 1
        } else if answer.1 == 0 && cur == k {
            answer.0 = time
            answer.1 += 1
        }
        
        let nexts = [cur + 1, cur - 1, cur * 2]
        for next in nexts {
            if next < 0 || next > 100_000 { // 인덱스 아웃
                continue
            }

            if !isVisited.contains(next) {
                queue.push((next, time + 1))
            }
        }
    }
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var answer = (0, 0)

bfs(n)
print(answer.0)
print(answer.1)