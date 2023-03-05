//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/03.
//

import Foundation

struct Heap {
    var heap: [(dest: Int, cost: Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(_ bus: (dest: Int, cost: Int)) {
        heap.append(bus)
        var curIdx = heap.count - 1
        
        while heap[curIdx].cost < heap[(curIdx - 1) / 2].cost && curIdx > 0 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() -> (dest: Int, cost: Int) {
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 <= heap.count - 1 {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = curIdx * 2 + 2
            var minChildIdx = lChildIdx

            if rChildIdx <= heap.count - 1 && heap[rChildIdx].cost < heap[minChildIdx].cost {
                minChildIdx = rChildIdx
            }
            if heap[minChildIdx].cost < heap[curIdx].cost {
                heap.swapAt(minChildIdx, curIdx)
                curIdx = minChildIdx
            } else {
                break
            }
        }
        return min
    }
}

func dijkstra(start: Int, end: Int) -> Int {
    var heap = Heap()
    var costs = [Int](repeating: 99_999_999_999, count: n + 1)
    heap.insert((dest: start, cost: 0))
    costs[start] = 0
    
    while !heap.isEmpty() {
        let (curCity, curCost) = heap.delete()
        if costs[curCity] < curCost {
            continue
        }
        for (dest, cost) in graph[curCity] {
            if curCost + cost < costs[dest] {
                costs[dest] = curCost + cost
                heap.insert((dest: dest, cost: curCost + cost))
            }
        }
    }
    return costs[end]
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph =  Array(repeating: [(Int, Int)](), count: n + 1)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[abc[0]].append((dest: abc[1], cost: abc[2]))
}
let se = readLine()!.split(separator: " ").map { Int(String($0))! }

print(dijkstra(start: se[0], end: se[1]))
