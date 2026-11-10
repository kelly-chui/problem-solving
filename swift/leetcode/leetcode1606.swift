// https://leetcode.com/problems/find-servers-that-handled-most-number-of-requests

class Solution {
    func busiestServers(_ k: Int, _ arrival: [Int], _ load: [Int]) -> [Int] {
        struct Heap<T> {
            private var container = [T]()
            private let comparer: (T, T) -> Bool

            var isEmpty: Bool { container.isEmpty }
            var peek: T? { container.first }

            init(comparer: @escaping (T, T) -> Bool) {
                self.comparer = comparer
            }

            mutating func push(_ value: T) {
                var current = container.count
                container.append(value)
                while current > 0 {
                    let parent = (current - 1) / 2
                    guard comparer(container[current], container[parent]) else {
                        break
                    }
                    container.swapAt(current, parent)
                    current = parent
                }
            }

            mutating func pop() -> T {
                container.swapAt(0, container.count - 1)
                let value = container.removeLast()
                var current = 0
                while current * 2 + 1 < container.count {
                    let left = current * 2 + 1
                    let right = left + 1
                    var target = left
                    if right < container.count,
                       comparer(container[right], container[left]) {
                        target = right
                    }
                    guard comparer(container[target], container[current]) else {
                        break
                    }
                    container.swapAt(current, target)
                    current = target
                }
                return value
            }
        }

        struct FenwickTree {
            private var tree: [Int]
            private let size: Int
            
            init(_ size: Int) {
                self.size = size
                self.tree = [Int](repeating: 0, count: size + 1)
                for i in 1...size {
                    tree[i] = i & -i
                }
            }

            mutating func update(_ index: Int, _ delta: Int) {
                var i = index + 1
                while i <= size {
                    tree[i] += delta
                    i += i & -i
                }
            }

            func prefixSum(_ end: Int) -> Int {
                var i = end
                var result = 0
                while i > 0 {
                    result += tree[i]
                    i -= i & -i
                }
                return result
            }

            func findByOrder(_ target: Int) -> Int {
                var index = 0
                var remaining = target
                var bit = 1
                while bit <= size / 2 {
                    bit <<= 1
                }
                while bit > 0 {
                    let next = index + bit
                    if next <= size && tree[next] < remaining {
                        remaining -= tree[next]
                        index = next
                    }
                    bit >>= 1
                }
                return index
            }
        }

        var requestCounts = [Int](repeating: 0, count: k)
        var busyHeap = Heap<(endTime: Int, serverID: Int)> {
            $0.endTime < $1.endTime
        }
        var available = FenwickTree(k)
        var availableCount = k
        for i in 0..<arrival.count {
            let start = arrival[i]
            let duration = load[i]
            while let busy = busyHeap.peek, busy.endTime <= start {
                let finished = busyHeap.pop()
                available.update(finished.serverID, 1)
                availableCount += 1
            }
            if availableCount == 0 {
                continue
            }
            let preferred = i % k
            let before = available.prefixSum(preferred)
            let order = before < availableCount ? before + 1 : 1
            let serverID = available.findByOrder(order)
            available.update(serverID, -1)
            availableCount -= 1
            requestCounts[serverID] += 1
            busyHeap.push((
                endTime: start + duration,
                serverID: serverID
            ))
        }
        let maxCount = requestCounts.max() ?? 0
        return (0..<k).filter {
            requestCounts[$0] == maxCount
        }
    }
}
