import Foundation

typealias Location = (x: Int, y: Int)
struct Heap {
    var heap = [(l: Location, d: Int)]()
    var isEmpty: Bool { heap.isEmpty }
    mutating func push(_ v: (Location, Int)) {
        heap.append(v)
        var cur = heap.count - 1
        while cur > 0 && heap[(cur - 1) / 2].d > heap[cur].d {
            heap.swapAt((cur - 1) / 2, cur)
            cur = (cur - 1) / 2
        }
    }
    mutating func pop() -> (l: Location, d: Int) {
        var cur = 0
        let popped = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        while cur * 2 + 1 <= heap.count - 1 {
            let lChild = cur * 2 + 1
            let rChild = lChild + 1
            var mChild = lChild
            if rChild <= heap.count - 1 && heap[mChild].d > heap[rChild].d {
                mChild = rChild
            }
            if heap[cur].d > heap[mChild].d {
                heap.swapAt(cur, mChild)
                cur = mChild
            } else {
                break
            }
        }
        return popped
    }
}

func dijkstra(_ root: Location) -> [[Int]] {
    let moves: [Location] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var heap = Heap()
    heap.push((root, 0))
    var distances = [[Int]](repeating: [Int](repeating: 987_654_321, count: m), count: n)
    distances[root.x][root.y] = 0
    while !heap.isEmpty {
        let (curNode, distance) = heap.pop()
        if distances[curNode.x][curNode.y] < distance {
            continue
        }
        for move in moves {
            let nextNode: Location = (curNode.x + move.x, curNode.y + move.y)
            if nextNode.x < 0 || nextNode.x >= n || nextNode.y < 0 || nextNode.y >= m {
                continue
            }
            if distances[nextNode.x][nextNode.y] > distance + classRoom[nextNode.x][nextNode.y] {
                distances[nextNode.x][nextNode.y] = distance + classRoom[nextNode.x][nextNode.y]
                heap.push((nextNode, distance + classRoom[nextNode.x][nextNode.y]))
            }
        }
    }
    return distances
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
let junan: Location = (xy[0] - 1, xy[1] - 1)
let chocobar: Location = (xy[2] - 1, xy[3] - 1)
var classRoom = [[Int]]()
for _ in 0..<n {
    classRoom.append(Array(readLine()!).map {
        if $0 == "0" || $0 == "*" {
            return 0
        } else {
            return 1
        }
    })
}
var answer = Int()
var distances = dijkstra(junan)
print(distances[chocobar.x][chocobar.y])