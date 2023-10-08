import Foundation

struct Queue {
    private var queue = [([Character], Int)]()
    private var ptr = 0
    var isEmpty: Bool { ptr >= queue.count }
    mutating func push(_ value: ([Character], Int)) {
        queue.append(value)
    }
    mutating func pop() -> ([Character], Int) {
        let returnValue = queue[ptr]
        ptr += 1
        if ptr > 50000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return returnValue
    }
}

func bfs(_ root: ([Character], Int)) -> Int {
    var queue = Queue()
    var answer = -1
    var criticalPath: [[Character]: [[Character]]] = [:]
    queue.push(root)
    var isVisited: Set<[Character]> = []
    var count = 0
    while !queue.isEmpty {
        let currentInteger = queue.pop()
        if currentInteger.1 != count {
            isVisited = []
            count = currentInteger.1
        }
        if currentInteger.1 == k {
            break
        }
        
        if let criticalPaths = criticalPath[currentInteger.0] {
            for path in criticalPaths {
                let pathInt = Int(String(path))!
                if currentInteger.1 + 1 == k && answer < pathInt {
                    answer = pathInt
                }
                queue.push((path, currentInteger.1 + 1))
                isVisited.insert(path)
            }
        } else {
            var paths = [[Character]]()
            for i in 0..<digit - 1 {
                for j in i + 1..<digit {
                    var nextInteger = (currentInteger.0, currentInteger.1 + 1)
                    nextInteger.0.swapAt(i, j)
                    if !isVisited.contains(nextInteger.0) && nextInteger.0[0] != Character("0") {
                        paths.append(nextInteger.0)
                        let nextIntegerInt = Int(String(nextInteger.0))!
                        if nextInteger.1 == k && answer < nextIntegerInt {
                            answer = nextIntegerInt
                        }
                        if nextInteger.1 < k {
                            queue.push(nextInteger)
                            isVisited.insert(nextInteger.0)
                        }
                    }
                }
            }
            criticalPath[currentInteger.0] = paths
        }
    }
    return answer
}

let nk = readLine()!.split(separator: " ")
let (n, k): ([Character], Int) = (Array(nk[0]), Int(nk[1])!)
let digit = n.count
print(bfs((n, 0)))
