import Foundation

struct Queue {
    var container = [Int]()
    var pointer = 0
    var isEmpty: Bool {
        container.count <= pointer
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

func bfs(graph: [Int: [Int]]) -> [Int: Int] {
    var queue = Queue()
    var distance = [Int: Int]()
    queue.push(1)
    distance[1] = 0
    
    while !queue.isEmpty {
        let curNode = queue.pop()
        for nextNode in graph[curNode, default: []] {
            guard distance[nextNode] == nil else {
                continue
            }
            queue.push(nextNode)
            distance[nextNode] = distance[curNode]! + 1
        }
    }
    return distance
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [Int: [Int]]()
    for e in edge {
        graph[e[0], default: []].append(e[1])
        graph[e[1], default: []].append(e[0])
    }
    let distance = bfs(graph: graph)
    let maxDistance = distance.map { $0.value }.max() ?? 0
    return distance.filter { $0.value == maxDistance }.count
}
