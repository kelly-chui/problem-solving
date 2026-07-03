// https://leetcode.com/problems/network-recovery-pathways

class Solution {
    typealias Edge = (v: Int, cost: Int)
    struct Heap {
        private var container = [Edge]()
        var isEmpty: Bool { container.isEmpty }
        
        mutating func push(edge: Edge) {
            var curPtr = container.count
            container.append(edge)
            while curPtr > 0 && container[curPtr].cost < container[(curPtr - 1) / 2].cost {
                container.swapAt(curPtr, (curPtr - 1) / 2)
                curPtr = (curPtr - 1) / 2
            }
        }
        mutating func pop() -> Edge {
            container.swapAt(0, container.count - 1)
            let topValue = container.removeLast()
            var curPtr = 0
            while curPtr * 2 + 1 < container.count {
                let leftPtr = curPtr * 2 + 1
                let rightPtr = leftPtr + 1
                var minPtr = leftPtr
                if rightPtr < container.count && container[leftPtr].cost > container[rightPtr].cost {
                    minPtr = rightPtr
                } 
                guard container[curPtr].cost > container[minPtr].cost else { break }
                container.swapAt(curPtr, minPtr)
                curPtr = minPtr
            }
            return topValue
        }
    }
    func dijkstra(graph: [[Edge]], start: Int, end: Int, n: Int, x: Int, k: Int) -> Bool {
        var heap = Heap()
        var costs = [Int](repeating: Int.max, count: n)
        heap.push(edge: (start, 0))
        costs[start] = 0
        
        while !heap.isEmpty {
            let (u, cost) = heap.pop()
            guard costs[u] >= cost else { continue }
            for (v, newCost) in graph[u] where newCost >= x {
                if cost + newCost < costs[v] {
                    costs[v] = cost + newCost
                    heap.push(edge: (v, cost + newCost))
                }
            }
        }
        return costs[end] != Int.max && costs[end] <= k
    }
    func upperBound(start: Int, end: Int, check: (Int) -> Bool) -> Int {
        var start = start
        var end = end
        var answer = -1
        while start <= end {
            let mid = start + (end - start) / 2
            if check(mid) {
                answer = mid
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return answer
    }
    func findMaxPathScore(_ edges: [[Int]], _ online: [Bool], _ k: Int) -> Int {
        let n = online.count
        var graph = [[Edge]](repeating: [], count: n)
        for edge in edges {
            let (u, v, cost) = (edge[0], edge[1], edge[2])
            guard online[u] && online[v] else { continue }
            guard cost <= k else { continue }
            graph[u].append((v, cost))
        }
        let maxCost = graph.flatMap { $0 }.map { $0.cost }.max() ?? 0
        return upperBound(start: 0, end: maxCost) { x in
            dijkstra(graph: graph, start: 0, end: n - 1, n: n, x: x, k: k)
        }
    }
}
