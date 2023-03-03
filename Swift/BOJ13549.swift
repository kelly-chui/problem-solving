//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/03.
//

import Foundation

struct Heap {
    var heap: [(node: Int, distance: Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(edge: (node: Int, distance: Int)) {
        heap.append(edge)
        var curIdx = heap.count - 1
        while curIdx > 0 && heap[curIdx].distance < heap[curIdx / 2].distance {
            heap.swapAt(curIdx, curIdx / 2)
            curIdx = curIdx / 2
        }
    }
    
    mutating func delete() -> (node: Int, distance: Int) {
        var curIdx = 0
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        
        while curIdx * 2 < heap.count {
            var minChildIdx = lChildIdx(curIdx: curIdx)
            if rChildIdx(curIdx: curIdx) < heap.count && heap[rChildIdx(curIdx: curIdx)].distance < heap[minChildIdx].distance {
                minChildIdx = rChildIdx(curIdx: curIdx)
            }
            if heap[minChildIdx].distance < heap[curIdx].distance {
                heap.swapAt(curIdx, minChildIdx)
                curIdx = minChildIdx
            } else {
                break
            }
        }
        return min
    }
    
    func lChildIdx(curIdx: Int) -> Int {
        return curIdx * 2
    }
    
    func rChildIdx(curIdx: Int) -> Int {
        return curIdx * 2 + 1
    }
}

func dijkstra(start: Int, target: Int) -> Int {
    if target < start {
        return start - target
    }
    var heap = Heap()
    var distances = [Int](repeating: 1_000_000_000, count: 100_001)
    heap.insert(edge: (node: start, distance: 0))
    distances[start] = 0
    
    while !heap.isEmpty() {
        let (curNode, dist) = heap.delete()
        if distances[curNode] < dist {
            continue
        }
        for linkedNode in [curNode * 2, curNode - 1, curNode + 1] {
            if linkedNode < 0 || linkedNode > 100_000 {
                continue
            }
            if linkedNode == curNode * 2 && dist < distances[linkedNode] {
                distances[linkedNode] = dist
                heap.insert(edge: (node: linkedNode, distance: dist))
            } else if dist + 1 < distances[linkedNode] {
                distances[linkedNode] = dist + 1
                heap.insert(edge: (node: linkedNode, distance: dist + 1))
            }
        }
    }
    return distances[target]
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
print(dijkstra(start: nk[0], target: nk[1]))
