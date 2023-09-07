import Foundation

struct Queue {
    private var queue = [(Int, Int)]()
    private var ptr = 0
    
    var isEmpty: Bool {
        ptr >= queue.count
    }
    
    mutating func push(_ value: (Int, Int)) {
        queue.append(value)
    }
    mutating func pop() -> (Int, Int) {
        let poppedValue = queue[ptr]
        ptr += 1
        /*
        if ptr > 50000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
         */
        return poppedValue
    }
}

func bfs(_ root: (Int, Int)) -> Int {
    var queue = Queue()
    isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    queue.push(root)
    isVisited[root.0][root.1] = true
    
    while !queue.isEmpty {
        let node = queue.pop()
        for move in moves {
            let newNode = (node.0 + move.0, node.1 + move.1)
            if newNode.0 < 0 || newNode.0 >= n || newNode.1 < 0 || newNode.1 >= m {
                continue
            }
            if graph[newNode.0][newNode.1] == 0 {
                meltingTable[node.0][node.1] += 1
                continue
            }
            if isVisited[newNode.0][newNode.1] {
                continue
            }
            queue.push((newNode.0, newNode.1))
            isVisited[newNode.0][newNode.1] = true
        }
    }
    
    return 1
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let moves = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var isVisited = [[Bool]]()
var answer = 0
var meltingTable = [[Int]]()

while true {
    var bfsCounter = 0
    isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    meltingTable = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    for row in 0..<n {
        for column in 0..<m {
            if graph[row][column] != 0 && !isVisited[row][column] {
                bfsCounter += bfs((row, column))
            }
        }
    }
    
    for row in 0..<n {
        for column in 0..<m {
            if graph[row][column] != 0 {
                graph[row][column] -= meltingTable[row][column]
                if graph[row][column] < 0 { graph[row][column] = 0 }
            }
        }
    }
    if bfsCounter == 0 {
        print(0)
        break
    }
    if bfsCounter > 1 {
        print(answer)
        break
    }
    
    answer += 1
}
