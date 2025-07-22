import Foundation

struct Deque {
    var container = [Int]()
    var pointer = 0
    var isEmpty: Bool { pointer >= container.count }
    var first: Int { container[pointer] }
    var last: Int { container.last! }
    mutating func push(_ value: Int) {
        container.append(value)
    }
    mutating func popFirst() -> Int {
        let headValue = container[pointer]
        pointer += 1
        return headValue
    }
    mutating func popLast() -> Int {
        return container.removeLast()
    }
}

func solution(_ stones:[Int], _ k:Int) -> Int {
    var deque = Deque()
    var result = Int.max
    for i in 0..<stones.count {
        while !deque.isEmpty && stones[deque.last] <= stones[i] {
            deque.popLast()
        }
        deque.push(i)
        if deque.first <= i - k {
            deque.popFirst()
        }
        if i >= k - 1 {
            result = min(result, stones[deque.first])
        }
    }
    return result
}