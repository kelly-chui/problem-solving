// https://leetcode.com/problems/minimum-operations-to-make-elements-within-k-subarrays-equal

class Solution {
    func minOperations(_ nums: [Int], _ x: Int, _ k: Int) -> Int {
        struct Heap<Element> {
            private var container = [Element]()
            private let sort: (Element, Element) -> Bool

            var count: Int { container.count }
            var isEmpty: Bool { container.isEmpty }
            var peek: Element? { container.first }

            init(sort: @escaping (Element, Element) -> Bool) {
                self.sort = sort
            }

            mutating func push(_ element: Element) {
                var current = container.count
                container.append(element)
                while current > 0 {
                    let parentIdx = (current - 1) / 2
                    guard sort(container[current], container[parentIdx]) else {
                        break
                    }
                    container.swapAt(current, parentIdx)
                    current = parentIdx
                }
            }

            @discardableResult
            mutating func pop() -> Element {
                if container.count == 1 {
                    return container.removeLast()
                }
                let headElement = container[0]
                container[0] = container.removeLast()
                var current = 0
                while current * 2 + 1 < container.count {
                    let leftChild = current * 2 + 1
                    let rightChild = leftChild + 1
                    var targetChild = leftChild
                    if rightChild < container.count,
                       sort(container[rightChild], container[leftChild]) {
                        targetChild = rightChild
                    }
                    if sort(container[targetChild], container[current]) {
                        container.swapAt(targetChild, current)
                        current = targetChild
                    } else {
                        break
                    }
                }

                return headElement
            }
        }

        struct SlidingMedian {
            private var maxHeap = Heap<Int>(sort: { a, b in
                return a > b
            })
            private var minHeap = Heap<Int>(sort: { a, b in
                return a < b
            })
            private var delayed = [Int: Int]()
            private var leftSize = 0
            private var rightSize = 0
            private var leftSum = 0
            private var rightSum = 0

            var cost: Int {
                guard let median = maxHeap.peek else {
                    return 0
                }
                let leftCost = median * leftSize - leftSum
                let rightCost = rightSum - median * rightSize
                return leftCost + rightCost
            }

            mutating func insert(_ value: Int) {
                if let median = maxHeap.peek, value > median {
                    minHeap.push(value)
                    rightSize += 1
                    rightSum += value
                } else {
                    maxHeap.push(value)
                    leftSize += 1
                    leftSum += value
                }
                rebalance()
            }

            mutating func remove(_ value: Int) {
                delayed[value, default: 0] += 1
                if let median = maxHeap.peek, value <= median {
                    leftSize -= 1
                    leftSum -= value
                    pruneMaxHeap()
                } else {
                    rightSize -= 1
                    rightSum -= value
                    pruneMinHeap()
                }
                rebalance()
            }
            private mutating func pruneMaxHeap() {
                while let top = maxHeap.peek,
                      delayed[top, default: 0] > 0 {
                    delayed[top, default: 0] -= 1
                    if delayed[top] == 0 {
                        delayed.removeValue(forKey: top)
                    }
                    maxHeap.pop()
                }
            }

            private mutating func pruneMinHeap() {
                while let top = minHeap.peek,
                      delayed[top, default: 0] > 0 {
                    delayed[top, default: 0] -= 1

                    if delayed[top] == 0 {
                        delayed.removeValue(forKey: top)
                    }

                    minHeap.pop()
                }
            }

            private mutating func rebalance() {
                if leftSize > rightSize + 1 {
                    pruneMaxHeap()
                    let value = maxHeap.pop()
                    minHeap.push(value)
                    leftSize -= 1
                    rightSize += 1
                    leftSum -= value
                    rightSum += value
                } else if leftSize < rightSize {
                    pruneMinHeap()
                    let value = minHeap.pop()
                    maxHeap.push(value)
                    rightSize -= 1
                    leftSize += 1
                    rightSum -= value
                    leftSum += value
                }
                pruneMaxHeap()
                pruneMinHeap()
            }
        }

        let n = nums.count
        let inf = Int.max / 4
        var costs = [Int](repeating: 0, count: n - x + 1)
        var median = SlidingMedian()
        for i in 0..<n {
            median.insert(nums[i])
            if i >= x - 1 {
                costs[i - x + 1] = median.cost
                median.remove(nums[i - x + 1])
            }
        }
        var previous = [Int](repeating: 0, count: n + 1)
        for _ in 1...k {
            var current = [Int](repeating: inf, count: n + 1)
            for i in 1...n {
                current[i] = current[i - 1]
                if i >= x && previous[i - x] != inf {
                    current[i] = min(
                        current[i],
                        previous[i - x] + costs[i - x]
                    )
                }
            }
            previous = current
        }
        return previous[n]
    }
}
