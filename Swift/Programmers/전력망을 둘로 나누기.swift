import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    func calSize(_ node: Int, _ parent: Int) -> Int {
        var size = 1
    
        for n in graph[node] {
            if n == parent { continue }
            size += calSize(n, node)
        }
        return size
    }
    
    var answer = n
    var graph = [[Int]]()
    for wire in wires {
        graph = [[Int]](repeating: [], count: n + 1)
        for w in wires {
            if w == wire { continue }
            graph[w[0]].append(w[1])
            graph[w[1]].append(w[0])
        }
        let diff = abs(calSize(wire[0], 0) - calSize(wire[1], 0))
        answer = min(answer, diff)
    }

    return answer
}
