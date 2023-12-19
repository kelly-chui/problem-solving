import Foundation

struct Heap {
    var heap = [(Int, Int)]()
    var isEmpty: Bool { heap.isEmpty }
    
    mutating func push(_ v: (Int, Int)) {
        heap.append(v)
        var current = heap.count - 1
        while current > 0 && heap[current].1 < heap[(current - 1) / 2].1 {
            heap.swapAt(current, (current - 1) / 2)
            current = (current - 1) / 2
        }
    }

    mutating func pop() -> (Int, Int) {
        let minElement = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var current = 0

        while current * 2 + 1 < heap.count {
            let left = current * 2 + 1
            let right = left + 1
            var minChild = left
            if right < heap.count && heap[minChild].1 > heap[right].1 {
                minChild = right
            }
            if heap[current].1 > heap[minChild].1 {
                heap.swapAt(current, minChild)
                current = minChild
            } else {
                break
            }
        }
        return minElement
    }
}

func dijkstra(_ root: Int, _ n: Int, _ graph: [[(Int, Int)]], _ friends: [Int]) -> Int {
    var heap = Heap()
    var distances = [Int](repeating: 987_654_321, count: n + 1)
    distances[root] = 0
    heap.push((root, 0))

    while !heap.isEmpty {
        let (room, distance) = heap.pop()
        if distances[room] < distance {
            continue
        }
        for (newRoom, newDistance) in graph[room] {
            if distances[newRoom] > distance + newDistance {
                distances[newRoom] = distance + newDistance
                heap.push((newRoom, distance + newDistance))
            }
        }
    }
    var distanceSum = 0
    for friend in friends {
        distanceSum += distances[friend]
    }
    return distanceSum
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (nm[0], nm[1])
    var graph = [[(Int, Int)]](repeating: [], count: n + 1)
    for _ in 0..<m {
        let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (a, b, c) = (abc[0], abc[1], abc[2])
        graph[a].append((b, c))
        graph[b].append((a, c))
    }
    let k = Int(readLine()!)!
    let friends = readLine()!.split(separator: " ").map { Int(String($0))! }
    var answer = Int()
    var minDistance = 987_654_321
    for roomNumber in 1...n {
        let sum = dijkstra(roomNumber, n, graph, friends)
        if minDistance > sum {
            answer = roomNumber
            minDistance = sum
        }
    }
    print(answer)
}
