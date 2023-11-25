import Foundation

struct Queue<element> {
    private var queue: [element] = []
    private var ptr = 0
    
    var isEmpty: Bool {
        ptr >= queue.count
    }
    
    mutating func push(_ v: element) {
        queue.append(v)
    }
    
    mutating func pop() -> element {
        let popped = queue[ptr]
        ptr += 1
        if ptr > 50000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return popped
    }
}

func bfs(_ root: Int, _ n: Int, _ k: Int) -> [Int] {
    var isVisited = [Int](repeating: -1, count: n + 1)
    var queue = Queue<Int>()
    var answer: [Int] = []
    queue.push(root)
    isVisited[root] = 0
    
    while !queue.isEmpty {
        let city = queue.pop()
        if let nextCities = cities[city] {
            for nextCity in nextCities {
                if isVisited[nextCity] != -1 {
                    continue
                }
                isVisited[nextCity] = isVisited[city] + 1
                if isVisited[nextCity] == k {
                    answer.append(nextCity)
                } else {
                    queue.push(nextCity)
                }
            }
        }
    }
    return answer
}

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k, x) = (info[0], info[1], info[2], info[3])
var cities: [Int: [Int]] = [:]

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    cities[ab[0], default: []].append(ab[1])
}

let answer = bfs(x, n, k)
if answer.isEmpty {
    print(-1)
} else {
    answer.sorted { $0 < $1 }.map { print($0, terminator: "\n") }
}

