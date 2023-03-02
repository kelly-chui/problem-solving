//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/02.
//

import Foundation

struct Heap {
    var heap: [(node: Int, distance: Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(tuple: (node: Int, distance: Int)) {
        heap.append(tuple)
        var curIdx = heap.count - 1
        
        while heap[curIdx / 2].distance > heap[curIdx].distance, curIdx > 0 {
            heap.swapAt(curIdx / 2, curIdx)
            curIdx = curIdx / 2
        }
    }
    
    mutating func delete() -> (Int, Int){
        var curIdx = 0
        var lChildIdx = Int()
        var rChildIdx = Int()
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        
        while curIdx < heap.count {
            lChildIdx = curIdx * 2
            rChildIdx = (curIdx * 2) + 1
            
            if curIdx * 2 > heap.count - 1 {
                break
            }
            var minChildIdx = lChildIdx
            if rChildIdx < heap.count && heap[rChildIdx].distance < heap[lChildIdx].distance {
                minChildIdx = rChildIdx
            }
            if heap[curIdx].distance > heap[minChildIdx].distance {
                heap.swapAt(minChildIdx, curIdx)
                curIdx = minChildIdx
            } else {
                break
            }
        }
        return min
    }
}

func daijkstra(start: Int) -> [Int] {
    var heap = Heap()
    heap.insert(tuple: (start, 0))
    var distances = [Int](repeating: 100_000_000_000, count: ne[0] + 1)
    distances[start] = 0
    
    while !heap.isEmpty() {
        let curNode = heap.delete()
        if distances[curNode.0] < curNode.1 {
            continue
        }
        for edge in graph[curNode.0] {
            let distanceSum = curNode.1 + edge.1
            if distanceSum < distances[edge.0] {
                distances[edge.0] = distanceSum
                heap.insert(tuple: (node: edge.0, distance: distanceSum))
            }
        }
    }
    return distances
}

let ne = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph = Array(repeating: [(Int, Int)](), count: ne[0] + 1)
for _ in 0..<ne[1] {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[abc[0]].append((abc[1], abc[2]))
    graph[abc[1]].append((abc[0], abc[2]))
}
let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
var distances = [[Int]](repeating: [Int](repeating: 100_000_000_000, count: ne[0] + 1), count: 5)

let daijkstra1 = daijkstra(start: 1)
let daijkstraN = daijkstra(start: ne[0])
let daijkstraA = daijkstra(start: ab[0])

let answer = min(daijkstra1[ab[0]] + daijkstraN[ab[1]] + daijkstraA[ab[1]], daijkstra1[ab[1]] + daijkstraN[ab[0]] + daijkstraA[ab[1]])
print(answer >= 100_000_000_000 ? -1 : answer)
