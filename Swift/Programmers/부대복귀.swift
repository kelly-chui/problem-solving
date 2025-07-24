import Foundation

struct Queue {
    var container = [Int]()
    var pointer = 0
    var isEmpty: Bool {
        pointer >= container.count
    }
    mutating func push(_ value: Int) {
        container.append(value)
    }
    mutating func pop() -> Int {
        let headValue = container[pointer]
        pointer += 1
        return headValue
    }
}

func bfs(_ start: Int, _ graph: [Int: [Int]], _ n: Int) -> [Int: Int] {
    var queue = Queue()
    var distances = [Int: Int]()
    distances[start] = 0
    queue.push(start)
    while !queue.isEmpty {
        let cur = queue.pop()
        for next in graph[cur, default: []] where distances[next] == nil {
            queue.push(next)
            distances[next] = (distances[cur] ?? 0) + 1
        }
    }
    return distances
}

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var graph = [Int: [Int]]()
    for road in roads {
        graph[road[0], default: []].append(road[1])
        graph[road[1], default: []].append(road[0])
    }
    let distances = bfs(destination, graph, roads.count)
    return sources.map { distances[$0] ?? -1 }
}
