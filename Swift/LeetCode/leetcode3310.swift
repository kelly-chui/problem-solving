// https://leetcode.com/problems/remove-methods-from-project

class Solution {
    func remainingMethods(_ n: Int, _ k: Int, _ invocations: [[Int]]) -> [Int] {
        var graph = [[Int]](repeating: [], count: n)
        for inv in invocations {
            let (a, b) = (inv[0], inv[1])
            graph[a].append(b)
        }

        struct Queue {
            private var container = [Int]()
            private var ptr = 0
            var isEmpty: Bool {
                ptr >= container.count
            }

            mutating func push(_ value: Int) {
                container.append(value)
            }
            mutating func pop() -> Int {
                let head = container[ptr]
                ptr += 1
                return head
            }
        }
        
        var queue = Queue()
        queue.push(k)
        var isSuspicious = Set<Int>()
        isSuspicious.insert(k)
        while !queue.isEmpty {
            let current = queue.pop()
            for next in graph[current] {
                guard !isSuspicious.contains(next) else { continue }
                isSuspicious.insert(next)
                queue.push(next)
            }
        }

        for method in 0..<n
        where !isSuspicious.contains(method)
            && graph[method].contains(where: { isSuspicious.contains($0) }) {
            return Array(0..<n)
        }
        return Array(0...n - 1).filter { !isSuspicious.contains($0) }
    }
}
