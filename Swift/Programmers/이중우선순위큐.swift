import Foundation

struct Heap {
    var container = [Int]()
    var isEmpty: Bool { container.isEmpty }
    var compare: (Int, Int) -> Bool
    var top: Int? { container.first }
    
    init(_ compare: @escaping (Int, Int) -> Bool = { $0 < $1 }) {
        self.compare = compare
    }
    
    mutating func push(_ v: Int) {
        var curIdx = container.count
        container.append(v)
        while curIdx > 0 && compare(container[curIdx], container[(curIdx - 1) / 2]) {
            container.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func pop() -> Int {
        var curIdx = 0
        container.swapAt(0, container.count - 1)
        let top = container.removeLast()
        while curIdx * 2 + 1 < container.count {
            let leftChildIdx = curIdx * 2 + 1
            let rightChildIdx = leftChildIdx + 1
            var minChildIdx = leftChildIdx
            if rightChildIdx < container.count && compare(container[rightChildIdx], container[minChildIdx]) {
                minChildIdx = rightChildIdx
            }
            guard compare(container[minChildIdx], container[curIdx]) else { break }
            container.swapAt(curIdx, minChildIdx)
            curIdx = minChildIdx
        }
        return top
    }
}

func solution(_ operations:[String]) -> [Int] {
    var minHeap = Heap()
    var maxHeap = Heap { $0 > $1 }
    var deletedMin = [Int: Int]()
    var deletedMax = [Int: Int]()
    var count = 0
    operations.map { $0.split(separator: " ").map { String($0) } }.forEach {
        if $0[0] == "I" {
            let value = Int($0[1])!
            minHeap.push(value)
            maxHeap.push(value)
            count += 1
        }
        if $0[0] == "D" && $0[1] == "1" && count > 0 {
            count -= 1
            var top = maxHeap.pop()
            while deletedMax[top] != nil {
                deletedMax[top]! -= 1
                if deletedMax[top] == 0 { deletedMax[top] = nil }
            }
            deletedMin[top, default: 0] += 1
        }
        if $0[0] == "D" && $0[1] == "-1" && count > 0 {
            count -= 1
            var top = minHeap.pop()
            while deletedMin[top] != nil {
                deletedMin[top]! -= 1
                if deletedMin[top] == 0 { deletedMin[top] = nil }
                guard !maxHeap.isEmpty else { break }
                top = minHeap.pop()
            }
            deletedMax[top, default: 0] += 1
        }
    }
    while !minHeap.isEmpty, let top = minHeap.top, deletedMin[top] != nil {
        deletedMin[top]! -= 1
        if deletedMin[top]! == 0 {
            deletedMin[top] = nil
        }
        _ = minHeap.pop()
    }
    while !maxHeap.isEmpty, let top = maxHeap.top, deletedMax[top] != nil {
        deletedMax[top]! -= 1
        if deletedMax[top]! == 0 {
            deletedMax[top] = nil 
        }
        _ = maxHeap.pop()
    }
    if count == 0 {
        return [0, 0]
    } else {
        return [maxHeap.top!, minHeap.top!]
    }
}