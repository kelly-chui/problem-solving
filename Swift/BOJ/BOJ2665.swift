//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/06.
//

import Foundation

struct Heap {
    var heap: [((Int, Int), Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(_ value: ((Int, Int), Int)) {
        heap.append(value)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].1 < heap[(curIdx - 1) / 2].1 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() -> ((Int, Int), Int) {
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 <= heap.count - 1 {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx <= heap.count - 1 && heap[rChildIdx].1 < heap[lChildIdx].1 {
                mChildIdx = rChildIdx
            }
            if heap[curIdx].1 > heap[mChildIdx].1 {
                heap.swapAt(curIdx, mChildIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        
        return min
    }
}

func dijkstra(_ start: (Int, Int)) -> [[Int]] {
    var heap = Heap()
    var distances = [[Int]](repeating: [Int](repeating: 999_999_999, count: n + 1), count: n + 1)
    let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    heap.insert((start, 0))
    distances[1][1] = 0
    
    while !heap.isEmpty() {
        let (node, dist) = heap.delete()
        if distances[node.0][node.1] < dist {
            continue
        }
        for move in moves {
            let newNode = (node.0 + move.0, node.1 + move.1)
            if newNode.0 < 1 || newNode.0 > n || newNode.1 < 1 || newNode.1 > n {
                continue
            }
            let newDist = graph[newNode.0 - 1][newNode.1 - 1] == 1 ? 0 : 1
            if distances[newNode.0][newNode.1] > dist + newDist {
                distances[newNode.0][newNode.1] = dist + newDist
                heap.insert((newNode, dist + newDist))
            }
        }
    }
    return distances
}

let n = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(Array(readLine()!).map{ Int(String($0))! })
}

print(dijkstra((1, 1))[n][n])
