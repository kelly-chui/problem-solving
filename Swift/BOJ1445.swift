import Foundation

func compare(_ node0: (Int, Int), _ node1: (Int, Int)) -> Bool {
    if node0.0 != node1.0 {
        return node0.0 < node1.0
    } else {
        return node0.1 < node1.1
    }
}

struct Heap {
    var heap = [((Int, Int), (Int, Int))]()
    var isEmpty: Bool { heap.isEmpty }
    mutating func push(_ value: ((Int, Int), (Int, Int))) {
        heap.append(value)
        var current = heap.count - 1
        while current > 0 && compare(heap[current].1, heap[(current - 1) / 2].1) { // 자식이 부모보다 작아야함
            heap.swapAt(current, (current - 1) / 2)
            current = (current - 1) / 2
        }
    }
    mutating func pop() -> ((Int, Int), (Int, Int)) {
        var current = 0
        heap.swapAt(0, heap.count - 1)
        let returnValue =  heap.removeLast()
        while current * 2 + 1 <= heap.count - 1 {
            let lChild = current * 2 + 1
            let rChild = lChild + 1
            var mChild = lChild
            if rChild <= heap.count - 1 && compare(heap[rChild].1, heap[mChild].1) { // r이 m보다 작야아함
                mChild = rChild
            }
            if compare(heap[mChild].1, heap[current].1) { // m이 c보다 작아야함
                heap.swapAt(mChild, current)
                current = mChild
            } else { break }
        }
        return returnValue
    }
}

func dijkstra(_ root: (Int, Int)) -> [[(Int, Int)]] {
    var heap = Heap()
    var distances = [[(Int, Int)]](repeating: [(Int, Int)](repeating: (initialValue, initialValue), count: m), count: n)
    heap.push((root, (0, 0)))
    distances[root.0][root.1] = (0, 0)
    while !heap.isEmpty {
        let (node, cost) = heap.pop()
        if compare(distances[node.0][node.1], cost) {
            continue
        }
        for move in moves {
            let newNode = (node.0 + move.0, node.1 + move.1)
            if newNode.0 < 0 || newNode.0 >= n || newNode.1 < 0 || newNode.1 >= m { continue }
            let newCost = forestCost[newNode.0][newNode.1]
            if compare((cost.0 + newCost.0, cost.1 + newCost.1), distances[newNode.0][newNode.1]) {
                distances[newNode.0][newNode.1] = (cost.0 + newCost.0, cost.1 + newCost.1)
                heap.push((newNode, distances[newNode.0][newNode.1]))
            }
        }
    }
    return distances
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var forest = [[String]]()
var forestCost = [[(Int, Int)]](repeating: [(Int, Int)](repeating: (0, 0), count: m), count: n)
for _ in 0..<n {
    forest.append(readLine()!.map { String($0) })
}
let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let initialValue = 987654321
var start = (0, 0)
var flower = (0, 0)
for row in 0..<n {
    for column in 0..<m {
        if forest[row][column] == "." {
            for move in moves {
                let adjNode = (row + move.0, column + move.1)
                if adjNode.0 < 0 || adjNode.0 >= n || adjNode.1 < 0 || adjNode.1 >= m {
                    continue
                }
                if forest[adjNode.0][adjNode.1] == "g" {
                    forestCost[row][column] = (0, 1)
                    break
                }
            }
        } else if forest[row][column] == "g" {
            forestCost[row][column] = (1, 0)
        } else if forest[row][column] == "S" {
            start = (row, column)
        } else if forest[row][column] == "F" {
            flower = (row, column)
        }
    }
}
let answer = dijkstra(start)[flower.0][flower.1]
print(answer.0, answer.1)
