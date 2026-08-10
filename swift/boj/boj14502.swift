import Foundation

func dfs(count: Int) {
    if count == 3 {
        bfs()
        return
    }
    for row in 0..<n {
        for column in 0..<m {
            if lab[row][column] != 0 { continue }
            lab[row][column] = 1
            dfs(count: count + 1)
            lab[row][column] = 0
        }
    }
}

func bfs() {
    struct Queue {
        private var queue = [(Int, Int)]()
        private var ptr = 0
        var isEmpty: Bool {
            ptr >= queue.count
        }
        init(queue: [(Int, Int)] = [(Int, Int)]()) {
            self.queue = queue
        }
        mutating func push(_ v: (Int, Int)) {
            queue.append(v)
        }
        mutating func pop() -> (Int, Int) {
            let popped = queue[ptr]
            ptr += 1
            return popped
        }
    }
    var tempLab = lab
    let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var queue = Queue(queue: virus)
    while !queue.isEmpty {
        let node = queue.pop()
        for move in moves {
            let newNode = (node.0 + move.0, node.1 + move.1)
            if newNode.0 < 0 || newNode.0 >= n || newNode.1 < 0 || newNode.1 >= m { continue }
            if tempLab[newNode.0][newNode.1] != 0 { continue }
            tempLab[newNode.0][newNode.1] = 2
            queue.push(newNode)
        }
    }
    answer = max(answer, tempLab.map { $0.filter { $0 == 0 }.count }.reduce(0) { $0 + $1 })
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var lab = [[Int]]()
var virus = [(Int, Int)]()
var answer = 0
for row in 0..<n {
    var column = 0
    lab.append(readLine()!.split(separator: " ").map {
        let cell = String($0)
        if cell == "2" {
            virus.append((row, column))
        }
        column += 1
        return Int(cell)!
    })
}
dfs(count: 0)
print(answer)
