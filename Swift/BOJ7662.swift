//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/03/21.
//

import Foundation

struct minHeap {
    var heap: [(Int, Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }

    mutating func insert(_ value: (Int, Int)) {
        heap.append(value)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].0 < heap[(curIdx - 1) / 2].0 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() {
        if count == 0 {
            return
        }
        while true {
            let temp = heap[0].1
            var curIdx = 0
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()
            
            while curIdx * 2 + 1 <= heap.count - 1 {
                let lChildIdx = curIdx * 2 + 1
                let rChildIdx = lChildIdx + 1
                var mChildIdx = lChildIdx
                
                if rChildIdx <= heap.count - 1 && heap[rChildIdx].0 < heap[mChildIdx].0 {
                    mChildIdx = rChildIdx
                }
                
                if heap[curIdx].0 > heap[mChildIdx].0 {
                    heap.swapAt(curIdx, mChildIdx)
                    curIdx = mChildIdx
                } else {
                    break
                }
            }
            if !isDeleted[temp] {
                isDeleted[temp] = true
                count -= 1
                break
            }
        }
    }
}

struct maxHeap {
    var heap: [(Int, Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(_ value: (Int, Int)) {
        heap.append(value)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].0 > heap[(curIdx - 1) / 2].0 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() {
        if count == 0 {
            return
        }
        while true {
            let temp = heap[0].1
            var curIdx = 0
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()
            
            while curIdx * 2 + 1 <= heap.count - 1 {
                let lChildIdx = curIdx * 2 + 1
                let rChildIdx = lChildIdx + 1
                var mChildIdx = lChildIdx
                
                if rChildIdx <= heap.count - 1 && heap[rChildIdx].0 > heap[mChildIdx].0 {
                    mChildIdx = rChildIdx
                }
                
                if heap[curIdx].0 < heap[mChildIdx].0 {
                    heap.swapAt(curIdx, mChildIdx)
                    curIdx = mChildIdx
                } else {
                    break
                }
            }
            if !isDeleted[temp] {
                isDeleted[temp] = true
                count -= 1
                break
            }
        }
    }
}

let t = Int(readLine()!)!
var isDeleted = [Bool]()
var count = Int()
for _ in 0..<t {
    let k = Int(readLine()!)!
    var minHeap = minHeap()
    var maxHeap = maxHeap()
    var serial = 0
    count = 0
    isDeleted = [Bool](repeating: false, count: 1_000_001)
    for _ in 0..<k {
        let command = readLine()!.split(separator: " ").map { String($0) }
        if command[0] == "D" {
            if command[1] == "1" {
                maxHeap.delete()
            } else {
                minHeap.delete()
            }
        } else {
            minHeap.insert((Int(command[1])!, serial))
            maxHeap.insert((Int(command[1])!, serial))
            serial += 1
            count += 1
        }
    }
    
    if count == 0 {
        print("EMPTY")
    } else {
        var queue: [Int] = []
        for element in minHeap.heap {
            if !isDeleted[element.1] {
                queue.append(element.0)
            }
        }
        queue.sort { $0 < $1 }
        print(queue.last!, queue.first!)
    }
}
