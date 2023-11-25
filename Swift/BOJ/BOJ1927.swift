//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/27.
//

import Foundation

func insert(_ value: Int) {
    heap.append(value)
    var currentIndex = heap.count - 1
    while currentIndex > 0 {
        let parentIndex = (currentIndex - 1) / 2
        if heap[currentIndex] < heap[parentIndex] {
            heap.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
        } else {
            break
        }
    }
}

func deleteMin() -> Int {
    if heap.isEmpty{
        return 0
    }
    let max = heap[0]
    heap[0] = heap[heap.count - 1]
    heap.removeLast()
    
    var currentIndex = 0
    while true {
        let leftChildIndex = 2 * currentIndex + 1
        let rightChildIndex = 2 * currentIndex + 2
        
        if leftChildIndex >= heap.count {
            break
        }
        
        var maxChildIndex = leftChildIndex
        
        if rightChildIndex < heap.count && heap[rightChildIndex] < heap[leftChildIndex] {
            maxChildIndex = rightChildIndex
        }
        
        if heap[maxChildIndex] < heap[currentIndex] {
            heap.swapAt(currentIndex, maxChildIndex)
            currentIndex = maxChildIndex
        } else {
            break
        }
    }
    return max
}


let n = Int(readLine()!)!
var heap: [Int] = []
for _ in 0..<n {
    let x = Int(readLine()!)!
    if x > 0 {
        insert(x)
    } else {
        print(deleteMin())
    }
}

