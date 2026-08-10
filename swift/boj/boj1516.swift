struct Queue {
    var container = [Int]()
    var ptr = 0
    var isEmpty: Bool {
        container.count <= ptr
    }
    mutating func push(_ value: Int) {
        container.append(value)
    }
    mutating func pop() -> Int {
        let headElement = container[ptr]
        ptr += 1
        return headElement
    }
}

let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n + 1)
var pinIn = [Int](repeating: 0, count: n + 1)
var time = [Int](repeating: 0, count: n + 1)
var dp = [Int](repeating: 0, count: n + 1)
var queue = Queue()

for building in 1...n {
    let query = readLine()!.split(separator: " ").map { Int($0)! }
    time[building] = query[0]
    dp[building] = query[0]
    let require = Array(query.dropFirst().dropLast())
    pinIn[building] = require.count
    for pre in require {
        graph[pre].append(building)
    }
}

for building in 1...n where pinIn[building] == 0 {
    queue.push(building)
}

while !queue.isEmpty {
    let current = queue.pop()
    for next in graph[current] {
        dp[next] = max(dp[next], dp[current] + time[next])
        pinIn[next] -= 1
        if pinIn[next] == 0 { queue.push(next) }
    }
}

for i in 1...n {
    print(dp[i])
}
