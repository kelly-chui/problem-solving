// https://school.programmers.co.kr/learn/courses/30/lessons/468373

import Foundation

func solution(_ n:Int, _ infection:Int, _ edges:[[Int]], _ k:Int) -> Int {
    func dfs(lastSelection: Int? = nil) {
        answer = max(answer, infectedNodes.count)
        if typeOrders.count == k {
            return
        }
        if infectedNodes.count == n {
            return
        }
        for selectedType in 1...3 where selectedType != lastSelection {
            let temp = infectedNodes
            infectedNodes = bfs(infections: infectedNodes, selectedType: selectedType)
            typeOrders.append(selectedType)
            dfs(lastSelection: selectedType)
            typeOrders.removeLast()
            infectedNodes = temp
        }
    }
    
    func bfs(infections: Set<Int>, selectedType: Int) -> Set<Int> {
        var queue = Array(infections)
        var isVisited = infections
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for (pipeType, next) in tree[cur, default: []] {
                guard pipeType == selectedType else { continue }
                guard !isVisited.contains(next) else { continue }
                queue.append(next)
                isVisited.insert(next)
            }
        }
        return isVisited
    }
    
    var tree = [Int: [(type: Int, node: Int)]]()
    edges.forEach { edge in
        tree[edge[0], default: []].append((edge[2], edge[1]))
        tree[edge[1], default: []].append((edge[2], edge[0]))
    }
    var typeOrders = [Int]()
    var infectedNodes = Set<Int>([infection])
    var answer = 1
    dfs()
    
    return answer
}
