//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/27.
//

import Foundation

struct Heap {
    var heap: [(Int, Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty ? true : false
    }

    mutating func insert(_ value: (Int, Int)) {
        heap.append(value)
        var currentIndex = heap.count - 1
        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2
            if heap[currentIndex].1 < heap[parentIndex].1 {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }

    mutating func deleteMin() -> (Int, Int) {
        if heap.isEmpty{
            return (0, 0)
        }
        let min = heap[0]
        heap[0] = heap[heap.count - 1]
        heap.removeLast()
        
        var currentIndex = 0
        while true {
            let leftChildIndex = 2 * currentIndex + 1
            let rightChildIndex = 2 * currentIndex + 2
            
            if leftChildIndex >= heap.count {
                break
            }
            var minChildIndex = leftChildIndex
            if rightChildIndex < heap.count && heap[rightChildIndex].1 < heap[leftChildIndex].1 {
                minChildIndex = rightChildIndex
            }
            if heap[minChildIndex].1 < heap[currentIndex].1 {
                heap.swapAt(currentIndex, minChildIndex)
                currentIndex = minChildIndex
            } else {
                break
            }
        }
        return min
    }
}

func dijkstra(k: Int) {
    var heap = Heap()
    heap.insert((k, 0))
    distanceTable[k] = 0
    while !heap.isEmpty() {
        let edge = heap.deleteMin()
        if distanceTable[edge.0] < edge.1 {
            continue
        }
        for node in graph[edge.0] {
            let cost = edge.1 + node.1
            if cost < distanceTable[node.0] {
                distanceTable[node.0] = cost
                heap.insert((node.0, cost))
            }
        }
    }
}

let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)!
var graph = [[(Int, Int)]](repeating: [], count: ve[0] + 1)
for _ in 0..<ve[1] {
    let uvw = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[uvw[0]].append((uvw[1], uvw[2]))
}
var distanceTable = [Int](repeating: 300_001, count: ve[0] + 1)

dijkstra(k: k)

for i in 1...ve[0] {
    if distanceTable[i] == 300_001 {
        print("INF")
    } else {
        print(distanceTable[i])
    }
}
