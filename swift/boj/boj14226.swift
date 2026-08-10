struct State: Hashable {
    var display: Int
    var clipboard: Int
    var time = 0

    init(_ tuple: (Int, Int)) {
        self.display = tuple.0
        self.clipboard = tuple.1
    }
}

struct Queue {
    var queue = [((Int, Int), Int)]()
    var ptr = 0
    var isEmpty: Bool { ptr >= queue.count }
    
    mutating func push(_ v: ((Int, Int), Int)) {
        queue.append(v)
    }

    mutating func pop() -> ((Int, Int), Int) {
        let firstValue = queue[ptr]
        ptr += 1
        if ptr > 100_000 {
            queue = Array(queue[ptr...])
            ptr = 0
        }
        return firstValue
    }
}

func bfs(_ start: (Int, Int)) {
    let moves = [
        { (_ tuple: (Int, Int)) -> (Int, Int) in return (tuple.0, tuple.0) },
        { (_ tuple: (Int, Int)) -> (Int, Int) in return (tuple.0 + tuple.1, tuple.1) },
        { (_ tuple: (Int, Int)) -> (Int, Int) in return (tuple.0 - 1, tuple.1) }
    ]
    
    var isVisited: Set<State> = []
    var queue = Queue()
    queue.push((start, 0))
    isVisited.insert(State(start))

    while !queue.isEmpty {
        let current = queue.pop()
        for move in moves {
            let next = move(current.0)
            if next.0 < 0 || next.0 > 2000 {
                continue
            }
            let nextState = State(next)
            if isVisited.contains(nextState) {
                continue
            }
            if next.0 == s {
                print(current.1 + 1)
                exit(0)
            }
            queue.push((next, current.1 + 1))
            isVisited.insert(nextState)
        }
    }
}

let s = Int(readLine()!)!
bfs((1, 0))
