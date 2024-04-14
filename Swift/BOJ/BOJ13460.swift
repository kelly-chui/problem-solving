import Foundation

struct Marble: Hashable {
    var rr: Int
    var rc: Int
    var br: Int
    var bc: Int
    
    init(_ tuple: ((Int, Int), (Int, Int))) {
        self.rr = tuple.0.0
        self.rc = tuple.0.1
        self.br = tuple.1.0
        self.bc = tuple.1.1
    }
}

struct Queue {
    var queue = [(((Int, Int), (Int, Int)), Int)]()
    var ptr = 0
    var isEmpty: Bool {
        queue.count <= ptr
    }

    mutating func push(_ v: (((Int, Int), (Int, Int)), Int)) {
        queue.append(v)
    }

    mutating func pop() -> (((Int, Int), (Int, Int)), Int) {
        let firstValue = queue[ptr]
        ptr += 1
        if ptr > 100_000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return firstValue
    }
}

func bfs(_ start: ((Int, Int), (Int, Int))) {
    let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    var queue = Queue()
    queue.push((start, 1))
    var isVisited: Set<Marble> = []
    isVisited.insert(Marble(start))
    
    while !queue.isEmpty {
        let (curStat, curCount) = queue.pop()
        if curCount > 10 {
            print(-1)
            exit(0)
        }
        for move in moves {
            var (nextRed, nextBlue) = curStat
            var (rCount, bCount) = (0, 0)
            while graph[nextRed.0 + move.0][nextRed.1 + move.1] != "#" && graph[nextRed.0][nextRed.1] != "O" {
                nextRed.0 += move.0
                nextRed.1 += move.1
                rCount += 1
            }
            while graph[nextBlue.0 + move.0][nextBlue.1 + move.1] != "#" && graph[nextBlue.0][nextBlue.1] != "O" {
                nextBlue.0 += move.0
                nextBlue.1 += move.1
                bCount += 1
            }
            if graph[nextBlue.0][nextBlue.1] == "O" {
                continue
            }
            if graph[nextRed.0][nextRed.1] == "O" {
                print(curCount)
                exit(0)
            }
            if nextRed == nextBlue {
                if rCount > bCount {
                    nextRed.0 -= move.0
                    nextRed.1 -= move.1
                } else {
                    nextBlue.0 -= move.0
                    nextBlue.1 -= move.1
                }
            }
            if isVisited.contains(Marble((nextRed, nextBlue))) {
                continue
            }
            isVisited.insert(Marble((nextRed, nextBlue)))
            queue.push(((nextRed, nextBlue), curCount + 1))
        }
    }
    print(-1)
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph = [[Character]]()
for _ in 0..<n {
    graph.append(Array(readLine()!))
}

var (startRed, startBlue) = ((0, 0), (0, 0))
for row in 0..<n {
    for column in 0..<m {
        if graph[row][column] == "R" {
            startRed = (row, column)
        } else if graph[row][column] == "B" {
            startBlue = (row, column)
        }
    }
}

bfs((startRed, startBlue))