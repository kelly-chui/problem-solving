import Foundation

typealias Location = (row: Int, col: Int)

enum Direction: Int {
    case u = 0, r, d, l
}

struct HeapNode: Comparable {
    var distance: Int
    var location: Location
    var direction: Direction
    
    static func < (lhs: HeapNode, rhs: HeapNode) -> Bool {
        return lhs.distance < rhs.distance
    }
    static func == (lhs: HeapNode, rhs: HeapNode) -> Bool {
        return lhs.distance == rhs.distance
    }
}

struct Heap {
    var container = [HeapNode]()
    var isEmpty: Bool { container.isEmpty }
    
    mutating func push(_ node: HeapNode) {
        var cur = container.count
        container.append(node)
        while cur > 0 && container[cur] < container[(cur - 1) / 2] {
            container.swapAt(cur, (cur - 1) / 2)
            cur = (cur - 1) / 2
        }
    }
    mutating func pop() -> HeapNode {
        var cur = 0
        container.swapAt(0, container.count - 1)
        let minValue = container.removeLast()
        while cur * 2 + 1 < container.count {
            let leftChild = cur * 2 + 1
            let rightChild = leftChild + 1
            var minChild = leftChild
            if rightChild < container.count, container[rightChild] < container[minChild] {
                minChild = rightChild
            }
            guard container[minChild] < container[cur] else { break }
            container.swapAt(minChild, cur)
            cur = minChild
        }
        return minValue
    }
}

func dijkstra(_ board: [[Int]], _ start: HeapNode, _ n: Int) -> Int {
    let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    var heap = Heap()
    var distances = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 4), count: n), count: n)
    heap.push(start)
    distances[0][0][start.direction.rawValue] = 0
    while !heap.isEmpty {
        let cur = heap.pop()
        for (idx, move) in moves.enumerated() {
            let nextLocation: Location = (cur.location.row + move.0, cur.location.col + move.1)
            guard 0..<n ~= nextLocation.row && 0..<n ~= nextLocation.col else { continue }
            guard board[nextLocation.row][nextLocation.col] == 0 else { continue }
            let nextDirection = Direction(rawValue: idx)!
            let distance = cur.direction == nextDirection ? 100 : 600
            let newDistance = distances[cur.location.row][cur.location.col][cur.direction.rawValue] + distance
            if distances[nextLocation.row][nextLocation.col][idx] > newDistance {
                distances[nextLocation.row][nextLocation.col][idx] = newDistance
                heap.push(HeapNode(distance: newDistance, location: nextLocation, direction: nextDirection))   
            }
        }
    }
    return distances[n - 1][n - 1].min() ?? 0
}

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    let rightStart = dijkstra(board, HeapNode(distance: 0, location: (0, 0), direction: .r), n)
    let downStart = dijkstra(board, HeapNode(distance: 0, location: (0, 0), direction: .d), n)
    return min(rightStart, downStart)
}
